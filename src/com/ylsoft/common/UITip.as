package com.ylsoft.common
{
	import com.ylsoft.core.AppConfig;
	import com.ylsoft.event.AppEvent;
	
	import flash.net.URLRequest;
	import flash.utils.Endian;
	
	import mx.controls.SWFLoader;
	import mx.core.FlexGlobals;
	import mx.graphics.GradientEntry;
	import mx.graphics.LinearGradient;
	import mx.graphics.RadialGradient;
	import mx.managers.PopUpManager;
	
	import spark.components.Group;
	import spark.components.HGroup;
	import spark.components.Label;
	import spark.primitives.Rect;
	

	public class UITip
	{
		private var _loading_message:String = null;
		
		private static var instance:UITip;
		
		private static var loading_group:HGroup;
		
		public function UITip(inner:InnerClass){}
		
		public function get loading_message():String
		{
			return _loading_message;
		}

		public function set loading_message(value:String):void
		{
			_loading_message = value;
		}
		
		public static function getInstance():UITip{
			if(instance == null){
				instance = new UITip(new InnerClass);
			}
			return instance;
		}

		public  function showLoadingTip(evt:AppEvent):void{
			if(loading_group != null)return;
			loading_group = new HGroup;
			loading_group.width = 200;
			loading_group.height = 34;
			
			//loading_group.drawRoundRect(0,0,loading_group.width,loading_group.height,null,Color.white,1.0);
			loading_group.verticalAlign = "middle";
			loading_group.graphics.beginFill(Color.white,1.0);
			loading_group.graphics.lineStyle(.5,Color.grey);
			loading_group.graphics.moveTo(0,0);
			loading_group.graphics.lineTo(200,0);
			loading_group.graphics.lineTo(200,34);
			loading_group.graphics.lineTo(0,34);
			loading_group.graphics.lineTo(0,0);
			loading_group.graphics.endFill();
			
			var loadingAnimation : SWFLoader = new SWFLoader();
			loadingAnimation.load(AppConfig.MATERIAL + "loading.swf");
			
			var label:Label = new Label();
			label.text = "处理中,请稍后...";
			if(this._loading_message != null)
			label.text = this._loading_message;
			
			loading_group.addElement(loadingAnimation);
			loading_group.addElement(label);
			
			PopUpManager.addPopUp(loading_group,FlexGlobals.topLevelApplication.root,true);
			PopUpManager.centerPopUp(loading_group);
		}
		
		public function removeLoadingTip(evt:AppEvent):void{
			PopUpManager.removePopUp(loading_group);
			loading_group = null;
		}
	}
}

class InnerClass{}