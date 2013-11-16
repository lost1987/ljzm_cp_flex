package com.ylsoft.common
{
	import com.hurlant.crypto.symmetric.CBCMode;
	import com.hurlant.crypto.symmetric.DESKey;
	import com.hurlant.util.Base64;
	
	import flash.utils.ByteArray;

	/**
	 * 
	 *字符串des加密解密 
	 * 
	 */
	public class DesSecurity
	{
		public function DesSecurity(clz:InnerClass)
		{
			_key.writeUTFBytes(_randDigits);
			_iv.writeUTFBytes(_randDigits);
			var des:DESKey = new DESKey(_key);
			_cbc = new CBCMode(des);
		}
		
		private static var _instance : DesSecurity = null;
		
		private  var _key:ByteArray = new ByteArray();
		private  var _iv :ByteArray = new ByteArray();
		private   var _randDigits : String = 'aaabbbcc';//可以随意设置8位的加密key和iv[PHP端必须也有相同的key和iv]
		private   var _cbc:CBCMode;
		
		public static function instance():DesSecurity{
			if(_instance == null){
				 _instance = new DesSecurity(new InnerClass);
			}
			return _instance;
		}
		
		/**
		 *加密字串 
		 * @param str 需要加密的原始字符串
		 * @return String 加密的字符串
		 */
		public  function encrypt(str:String):String{
				_cbc.IV = _iv;
				var tmpByteArray:ByteArray = this.convertStringToByteArray(str); //转换成二进制编码 (该函数自己定义)
				_cbc.encrypt(tmpByteArray);                         //利用加密模式对数据进行加密
			    return  Base64.encodeByteArray(tmpByteArray); //利用base64对密文进行编码
		}
		
		/***
		 * 
		 *解密字串 
		 * @param str  加密过的字符串
		 * @return  String  未加密的原始字串
		 */
		public  function decrypt(str:String):String{
			var tmpByteArray:ByteArray = Base64.decodeToByteArray(str); //因为刚才加密的是把密文进行base64编码了,现在解码
			_cbc.decrypt(tmpByteArray);                        //利用加密模式的解密算法解码
			var source:String=this.convertByteArrayToString(tmpByteArray); //把二进制数据转换成字符串 函数代码如下
			return source;
		}
		
		//String转ByteArray函数
		private function convertStringToByteArray(str:String):ByteArray
		{
			var bytes:ByteArray;
			if (str)
			{
				bytes=new ByteArray();
				bytes.writeUTFBytes(str);
			}
			return bytes;
		}
		
		private function convertByteArrayToString(bytes:ByteArray):String
		{
			var str:String;
			if (bytes)
			{                
				bytes.position=0;
				str=bytes.readUTFBytes(bytes.length);
			}
			
			return str;
		} 
	}
}

class InnerClass{}