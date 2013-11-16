package com.ylsoft.core
{

	public class ModuleGlobal
	{
		public static var Modulefactory_pre_unload:Array;//下次装载新module的时候需要卸载的module
		public static var Modulefactory_login:ModuleFactory;//登录模块
		public static var Modulefactory_left:ModuleFactory;//左侧导航模块
		public static var  Modulefactory_main:ModuleFactory;///右侧主内容模块
		
		
		public static  function unloadModules():void{
			if(ModuleGlobal.Modulefactory_pre_unload != null){
				for each(var module:ModuleFactory in ModuleGlobal.Modulefactory_pre_unload){
					module.unloadModule();
				}
			}
			ModuleGlobal.Modulefactory_pre_unload = null;
		}
		
	}
}

