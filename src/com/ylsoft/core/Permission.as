package com.ylsoft.core
{
	import mx.controls.Alert;
	import mx.core.FlexGlobals;

	public class Permission
	{
		/**
		 * 赋予权限
		 * @param array popes 权限
		 * @return int 权值
		 */
		public static function give(permissions:Array):Number{
			
			var value:Number = 0;
			for(var i : Number= 0 ; i < permissions.length ; i++){
				value |= int(permissions[i]);
			}
			
			return value;
		}
		
		
		/**
		 * 判断是否有权限
		 * @param int user_pope
		 * @param int module_pope
		 * return boolean
		 */
		public static function hasPermission(permission_admin:Number,permission_module:Number):Boolean{
			
			if(permission_admin & permission_module){
				return true;
			}
			return false;
			
		}
		
		
		/**
		 * 检查权限
		 */
		public  static function checkPermssion(permission_admin:Number,permission_module:Number):void{
			if(!(permission_admin & permission_module)){
				FlexGlobals.topLevelApplication.removeAllElements();
				Alert.show('非法操作');
			}
		}
	}
}

