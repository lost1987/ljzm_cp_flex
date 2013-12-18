package com.ylsoft.core
{
	import com.ylsoft.event.AppEvent;
	
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.rpc.events.FaultEvent;
	import mx.rpc.events.ResultEvent;
	import mx.rpc.remoting.RemoteObject;

	public class Amf
	{
		
		private var _remoteObject : UIRemoteObject;
		
		private static var _self : Amf;
		
		private var _result:Object;
		
		private var _callback : Function ;
		
		private var _faultMsg:String;
		
		private var _use_waiting_image:*;
		
		public function Amf()
		{
			//singleton
			this._remoteObject = new UIRemoteObject();
		}
		
		/**
		 * 注册result返回的回调函数
		 * */
		public function registerCallBack(callback:Function,params:Array=null):void{
			//再application上注册这个函数
			if(params == null)
				this._remoteObject.addEventListener(AppEvent.AMF_GLOABAL_COMPLETE,callback);
			else 
				this._remoteObject.addEventListener(AppEvent.AMF_GLOABAL_COMPLETE,EventDelegate.createWithoutEvent(callback,params));
				this._callback = callback;
		}
		
		
		public function setFaultMessage(msg:String):void{
			this._faultMsg = msg;
		}
		
		
		public function startService(service:String,method:String,...arguments):Amf{
			//清空结果
			this._result = null;
			//开始调用
			this._remoteObject.showBusyCursor = false;
			this._remoteObject.destination = 'amfphp';//必须指定 并不一定需要service-config.xml 因为endpoint会指定destination
			this._remoteObject.source = service;
			this._remoteObject.endpoint = AppConfig.AMFURL;
			this._remoteObject.addEventListener(ResultEvent.RESULT,returnData);
			this._remoteObject.addEventListener(FaultEvent.FAULT,showFault);
			this._remoteObject.use_waiting_image = this._use_waiting_image == null ? AppConfig.USE_WAITING_IMAGE : this._use_waiting_image as Boolean;
			
			if(arguments.length == 0){
				this._remoteObject.getOperation(method).send('');
				return this;
			}
			
			switch(arguments.length){
				case 1:this._remoteObject.getOperation(method).send(arguments[0]);break;
				case 2:this._remoteObject.getOperation(method).send(arguments[0],arguments[1]);break;
				case 3:this._remoteObject.getOperation(method).send(arguments[0],arguments[1],arguments[2]);break;
			}
			return this;
		}
		
		
		private function returnData(evt:ResultEvent):void{
			this._result = evt.result;//先吧结果赋值在触发完成事件 这样在回调中就不会出现空result的错误了
			this._remoteObject.dispatchEvent(new AppEvent(AppEvent.AMF_GLOABAL_COMPLETE));
			this.clearEvent();
//			Alert.show(evt.result.toString());
		}
		
		private function showFault(evt:FaultEvent):void{
			   if(this._faultMsg!=null){
				   Alert.show(this._faultMsg);
			   }else{
				   Alert.show(evt.fault.message);
			   }
			   this.clearEvent();
		}
		
		
		public function getResult():Object{
			return this._result;
		}
		
		private function clearEvent():void{
			this._remoteObject.removeEventListener(ResultEvent.RESULT,returnData);
			this._remoteObject.removeEventListener(FaultEvent.FAULT,showFault);
			this._remoteObject.removeEventListener(AppEvent.AMF_GLOABAL_COMPLETE,this._callback);
			FlexGlobals.topLevelApplication.dispatchEvent(new AppEvent(AppEvent.UIREMOTEOBJECT_FINISH));
		}
		
		
		public function get use_waiting_image():*
		{
			return _use_waiting_image;
		}
		
		public function set use_waiting_image(value:*):void
		{
			_use_waiting_image = value;
		}
		
	}
}
