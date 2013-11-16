package com.ylsoft.common
{
	import mx.controls.DateChooser;
	import mx.core.mx_internal;
	import mx.styles.CSSStyleDeclaration;
	import mx.styles.StyleManager;
	import mx.validators.EmailValidator;
	
	/**
	 *  重写DateChooser
	 *  设置默认中文显示
	 *  添加了时分秒的选择
	 *
	 */
	public class MyDateChooser extends DateChooser
	{
		public var times:MyTimeChooser;
		
		public function MyDateChooser()
		{
			super();
			this.width=250;
			this.height=250;
			this.dayNames=["日", "一", "二", "三", "四", "五", "六"];
			this.monthNames=["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
			times=new MyTimeChooser();
			times.width=this.width;
			times.x=10;
			times.y=190;
		}
		
		protected override function createChildren():void
		{
			super.createChildren();
			addChild(times);
		}
		/**
		 * 重写显示方法，设置日期dateGrid显示高度，控制按钮不被日期遮挡
		 * @param unscaledWidth
		 * @param unscaledHeight
		 */
		override protected function updateDisplayList(unscaledWidth:Number,
													  unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			var dg:Object = this.mx_internal::dateGrid;
			if(dg && dg.hasOwnProperty("height")){
				dg["height"] = 150;
			}
		}
	}
}