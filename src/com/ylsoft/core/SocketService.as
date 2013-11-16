package com.ylsoft.core
{
	/**
	 *普通socket类 
	 */	
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.net.Socket;
	
	import mx.controls.Alert;
	
	public class SocketService
	{
		
		private var host:String;
		private var port:uint;
		private var socket:Socket;
		private var result:*;
		private var dataCallback:Function;//用于解析服务器返回数据的回调函数 需当作参数传入registerDataCallback
		private var command:String; //初次连接成功时发送的信息
		
		/**
		 * 
		 * @param host  主机地址
		 * @param port  端口
		 * @param connectCallback 连接成功的回调函数
		 * @param closeCallback  关闭的回调函数
		 * 
		 */		
		public function SocketService(host:String,port:uint)
		{
			this.socket = new Socket();
			this.host = host;
			this.port = port;
		}
		
		public function registerDataCallBack(fun:Function):void{
			this.dataCallback = fun;
		}
		
		public function connect():void{
			//监听连接成功事件
			this.socket.addEventListener(Event.CONNECT,connectCallback);
			//监听关闭事件
			this.socket.addEventListener(Event.CLOSE,closeCallback);
			//监听服务器新信息
			this.socket.addEventListener(ProgressEvent.SOCKET_DATA,socketCallback);
			this.socket.connect(host,port);
		}
		
		
		public function destroy():void{
			this.socket.dispatchEvent(new Event(Event.CLOSE));
		}
		
		public function setCommand(message:String):void{
			this.command = message;
		}
		
		private function connectCallback(evt:Event):void{
			//Alert.show(socket.connected.toString());
			if(this.command != null){
				this.send(this.command);
			}
		}
		
		private function closeCallback(evt:Event):void{
			this.socket.removeEventListener(Event.CONNECT,connectCallback);
			this.socket.removeEventListener(ProgressEvent.SOCKET_DATA,socketCallback);
			this.socket.removeEventListener(Event.CLOSE,closeCallback);
			this.socket.close();
		}
		
		private function socketCallback(evt:ProgressEvent):void{
			//循环读取数据，socket的bytesAvailable对象存放了服务器传来的所有数据
			this.dataCallback(socket.bytesAvailable);
		}
		
		public function send(obj:*):void{
			if(socket.connected){
				var type:String = typeof obj;
				switch(type){
					case 'String': 
						socket.writeUTFBytes(obj);
						socket.flush();
						break;
				}
			}
		}
	}
}