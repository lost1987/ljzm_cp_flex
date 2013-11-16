package com.ylsoft.core
{
	/***
	 * 
	 * 重写remoteObject的方法 使其能够使用遮罩
	 * 
	 * */
	import com.ylsoft.event.AppEvent;
	
	import mx.core.FlexGlobals;
	import mx.core.mx_internal;
	import mx.rpc.AbstractOperation;
	import mx.rpc.remoting.Operation;
	import mx.rpc.remoting.RemoteObject;
	import mx.utils.ObjectUtil;
	
	use namespace mx_internal;
	
	public class UIRemoteObject extends RemoteObject
	{
		
		public var use_waiting_image:Boolean ;
		
		public function UIRemoteObject(destination:String=null)
		{
			super(destination);
		}
		
		override public function getOperation(name:String):AbstractOperation
		{
			var op:AbstractOperation = super.getOperation(name);
			if (op == null)
			{
				op = new Operation(this, name);
				_operations[name] = op;
				op.asyncRequest = asyncRequest;
			}
			//发送UI提示加载数据遮罩事件
			if(use_waiting_image)
			FlexGlobals.topLevelApplication.dispatchEvent(new AppEvent(AppEvent.UIREMOTEOBJECT_SEND));
			return op;
		}
		
	}
}