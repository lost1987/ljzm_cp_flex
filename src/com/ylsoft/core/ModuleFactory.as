package com.ylsoft.core
{
	import mx.controls.Alert;
	import mx.core.FlexGlobals;
	import mx.core.IVisualElement;
	import mx.core.IVisualElementContainer;
	import mx.events.ModuleEvent;
	import mx.modules.IModuleInfo;
	import mx.modules.ModuleManager;
	import mx.modules.ModuleManagerGlobals;
	
	import spark.components.Application;
	import spark.modules.Module;
	import spark.modules.ModuleLoader;

	public class ModuleFactory
	{
		
		private static var  _modulefactory:ModuleFactory;
		
		private var ml:ModuleLoader;//必须全局变量,不然会被GC回收 导致module加载不出来也不报错 坑爹!
		
		private var	container:IVisualElementContainer; //被加载的模块需要添加进的容器
		
		private var pb:UIProgressBar;
		
		private var moduleName:String;
		
		public function ModuleFactory()
		{
			ml = new ModuleLoader();
		}
		
		public function setProgress(pb:UIProgressBar):void{
			this.pb = pb;
		}
		
		public function loadModule(moduleName:String,container:Object) : void{
			this.unloadModule();
			this.moduleName = moduleName;
			this.container = container as IVisualElementContainer;
			ml.addEventListener(ModuleEvent.READY,moduleReady);
			ml.addEventListener(ModuleEvent.ERROR,moduleLoadError);
			ml.addEventListener(ModuleEvent.PROGRESS, onModuleProgress); 
			
			if(pb!=null){
				pb.showProgressBar();
			}
			ml.loadModule(AppConfig.MODULEPATH+moduleName+".swf");
		}
		
		private function moduleReady(evt:ModuleEvent):void{
			if(pb!=null){
				this.pbClear();
			}
			var module:IVisualElement = evt.module.factory.create() as IVisualElement;
			this.container.addElement(module);
		}
		
		private function moduleLoadError(evt:ModuleEvent):void{
			Alert.show(evt.errorText);
		}
		
		public function unloadModule():void{
			this.ml.unloadModule();
		}
		
		private function onModuleProgress(evt:ModuleEvent):void{
			if(pb!=null){
				pb.setProgress(evt.bytesLoaded,evt.bytesTotal);
			}
		}
		
		private function pbClear():void{
			FlexGlobals.topLevelApplication.removeElement(pb);
			pb.clear();
			this.pb = null;
		}
		
		public function reload():void{
			if(ml!=null){
				this.unloadModule();
				this.loadModule(this.moduleName,this.container);
			}
		}
		
	}
}
