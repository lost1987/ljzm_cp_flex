package com.ylsoft.common
{
	import flash.display.Sprite;
	
	import mx.controls.Alert;
	import mx.events.CloseEvent;
	
	public class Message
	{
		public function Message()
		{
				
		}
		
		/**
		 * 
		 * callBack 点击 确认的时候 需要调用的函数
		 **/
		public static function confirm(msg:String,parent:Sprite,callBack:Function,params:Array=null):void{
			Alert.yesLabel = '确定';
			Alert.noLabel = '取消';
			
			Alert.show(msg,"请确认",1|2,parent,function(evt:CloseEvent):void{
							if(evt.detail == Alert.YES){
								callBack.apply(null,params);
							}
				});
		}
	}
}