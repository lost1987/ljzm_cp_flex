package com.ylsoft.common
{
	import ronco.base.*;
	
	public class Msg_ServerCode
	{
	/**
	*	_pid   传要操作的pid
	*	_code 传1表示T人 2表示邮件
	*/
	
		public static var _SIZE:int = 10;
		public static var _MAINID:int = 10;
		public static var _ASSID:int = 1;
		
		public var pid:int;
		public var code:int;
		
		public function OnRecvMsg(_client:NetCore31, _msg:NetBuff31):void
		{
			if(_msg.length != _SIZE)
			{
				MainLog.singleton.output("msg length fail! - ServerCode");
				return ;
			}
			
			pid = _msg.getInt(0);
			code = _msg.getUByte(4);
			
			onProcMsg(_client, _msg);
		}
		public function onProcMsg(_client:NetCore31, _msg:NetBuff31):void
		{
		}
		public static function sendMsg(_core:NetCore31, _pid:int, _code:int):void
		{
			_core.buffSend.setMsgHead(_MAINID, _ASSID, _SIZE, _core.msgIDSend);
			
			_core.buffSend.writeInt(_pid);
			_core.buffSend.writeUByte(_code);
			
			_core.sendMsg();
		}
	}
}
