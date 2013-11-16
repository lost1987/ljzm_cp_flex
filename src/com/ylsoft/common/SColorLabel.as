package com.ylsoft.common
{
	import spark.components.Label;
	import spark.components.gridClasses.GridItemRenderer;
	import spark.skins.spark.DefaultGridItemRenderer;
	
	/**
	 * 为spark的itemrender 定义字体的颜色设定
	 * 可用于s:datagrid的Column的itemRender
	 * */
	public class SColorLabel extends DefaultGridItemRenderer
	{
		
		private var _color:uint;
		
		public function SColorLabel()
		{
			super();
		}
		
		public function get color():uint
		{
			return _color;
		}

		public function set color(value:uint):void
		{
			_color = value;
		}

		override public function set data(value:Object):void
		{
			// TODO Auto Generated method stub
			super.data = value;
			this.setStyle('color',color);
		}
		
	}
}