package com.ylsoft.config
{
	/*****
	 * 
	 * 
	 * 模块中需要用到的数据变量,这些值 不放在数据库中.
	 * 
	 * */
	import mx.collections.ArrayCollection;

	public class ContentConfig
	{
		
		public function get_admin_apply_permission():ArrayCollection{
			 var permissions:ArrayCollection = new ArrayCollection([
				{label:"客服权限",value:"1"},
				{label:"运营权限",value:"2"},
				{label:"最高权限",value:"3"}
			]);
			return permissions;
		}
		
		public function get_states():ArrayCollection{
			var state:ArrayCollection = new ArrayCollection([
				{label:"未处理",value:0},
				{label:"已拒绝",value:1},
				{label:"已批准",value:2}
			]);
			return state;
		}
		
	}
}