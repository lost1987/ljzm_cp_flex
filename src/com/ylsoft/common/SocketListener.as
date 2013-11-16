package com.ylsoft.common
{
	import mx.collections.ArrayCollection;
	
	import ronco.base.ListenerMsgProc31;
	import ronco.base.NetBuff31;
	import ronco.base.NetCore31;
	
	public class SocketListener implements ListenerMsgProc31
	{
		
		private var players : ArrayCollection;
		public  var action : uint = 1; //操作 对应 Msg_ServerCode里的操作代码
		
		public function SocketListener(players:ArrayCollection){
			this.players = players;
		}
		
		public function onConnect(_client:NetCore31):void
		{
			for each(var obj:Object in players){
				Msg_ServerCode.sendMsg(_client,obj.id,this.action);
			}
		}
		
		public function onClose(_client:NetCore31):void
		{
		}
		
		public function onRecvMsg(_client:NetCore31, _msg:NetBuff31):void
		{
		}
	}
}