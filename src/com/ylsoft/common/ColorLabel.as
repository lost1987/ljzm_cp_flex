package com.ylsoft.common
{
	/**
	 * 为mx:itemRenderer提供字体色彩改变
	 * 
	 * */
	import flash.events.MouseEvent;
	
	import mx.controls.Label;
	import mx.events.DragEvent;
	import mx.states.SetStyle;
	
	public class ColorLabel extends Label
	{
		
		public static var color:uint = Color.purple;
		
		public function ColorLabel()
		{
			super();
		}
		
		override public function set data(value:Object):void
		{
			// TODO Auto Generated method stub
			super.data = value;
			if(value.hasOwnProperty('color')){
				this.setStyle('color',Color[value.color]);
			}else{
				this.setStyle('color',color);
			}
		}
	}
}