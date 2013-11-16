package com.ylsoft.core
{
	import flash.text.TextFormatAlign;
	
	import mx.controls.ProgressBar;
	import mx.controls.ProgressBarLabelPlacement;
	import mx.controls.ProgressBarMode;
	import mx.core.FlexGlobals;
	import mx.core.IVisualElementContainer;
	
	public class UIProgressBar extends ProgressBar
	{
		
		private static var _self:UIProgressBar;
		
		public function UIProgressBar(innerClass:InnerClass)
		{
			super();
		}
		
		public static function getInstance():UIProgressBar{
			if(_self == null){
				_self = new UIProgressBar(new InnerClass);
			}
			return _self;
		}
		
		public function showProgressBar():void{
			if(_self != null){
				this.horizontalCenter = 0;
				this.verticalCenter = 0;
				this.mode = ProgressBarMode.MANUAL;
				this.labelPlacement = ProgressBarLabelPlacement.CENTER;
				//this.indeterminate = true;
				this.label = "正在加载";
				this.setStyle("barColor",0x3366FF);
				this.setStyle("textAlign",TextFormatAlign.CENTER);
				FlexGlobals.topLevelApplication.addElement(this);
				FlexGlobals.topLevelApplication.setElementIndex(this,FlexGlobals.topLevelApplication.numElements-1);
			}
		}
		
		public function clear():void{
			_self = null;
		}
	}
}

internal class InnerClass{}