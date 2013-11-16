package com.ylsoft.core
{
	import flash.net.SharedObject;
	
	import mx.controls.Alert;

	public class AsCookie
	{
		
		private static var _self: AsCookie;
		
		private var _so:SharedObject ;
		
		public function AsCookie(innerClass:InnerClass)
		{
			this._so = SharedObject.getLocal('usr');
		}
		
		public static function getInstance():AsCookie{
			if(_self == null){
				_self = new AsCookie(new InnerClass);
			}
			return _self;
		}
		
		public function setUserdata(key:String,data:Object):void{
			 this._so.setProperty(key,data);
			 this._so.flush();
		}
		
		public function getUserdata(key:String):Object{
			 return _so.data[key];
		}
		
		public function clearUserdata(keyArray:Array):void{
			  for each(var key:String in keyArray){
				  _so.setProperty(key,null);
			  }
		}
		
		public function clear():void{
			this._so.clear();
		}
	}
}

internal class InnerClass{}