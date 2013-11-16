package com.ylsoft.common
{
	
	import flash.events.MouseEvent;
	
	import mx.controls.DateChooser;
	import mx.controls.DateField;
	import mx.core.ClassFactory;
	import mx.core.mx_internal;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.DropdownEvent;
	import mx.formatters.DateFormatter;
	import mx.skins.spark.DateChooserNextMonthSkin;
	import mx.skins.spark.DateChooserNextYearSkin;
	import mx.skins.spark.DateChooserPrevMonthSkin;
	import mx.skins.spark.DateChooserPrevYearSkin;
	
	import spark.components.supportClasses.Skin;
	import spark.skins.SparkSkin;
	
	/**
	 
	 *  重写DateField
	 
	 *  设置默认中文显示
	 
	 *  添加了时分秒的选择
	 
	 * 当时分秒值改变时显示值也改变
	 
	 */
	
	public class MyDateField extends DateField
		
	{
		
		public var chooser:MyDateChooser;
		
		
		public function MyDateField()
		{
			
			super();
			
			this.formatString="YYYY-MM-DD";
			
			this.dayNames=["日", "一", "二", "三", "四", "五", "六"];
			
			this.monthNames=["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"];
			
			this.dropdownFactory=new ClassFactory(MyDateChooser);
			
			this.labelFunction=formatDate;
			
			this.yearNavigationEnabled = true;
			
			//监听时间值变化
			
			this.addEventListener(CalendarLayoutChangeEvent.CHANGE, onChange);
			
			//监听dateChooser的打开事件
			
			this.addEventListener(DropdownEvent.OPEN,checkDateChooserPosition);
			
			this.initStyles();
			
		}
		
		private function initStyles():void{
			
			this.setStyle('prevMonthUpSkin',DateChooserPrevMonthSkin);
			this.setStyle('prevMonthOverSkin',DateChooserPrevMonthSkin);
			this.setStyle('prevMonthDownSkin',DateChooserPrevMonthSkin);
			this.setStyle('prevMonthDisabledSkin',DateChooserPrevMonthSkin);
			
			this.setStyle('nextMonthUpSkin',DateChooserNextMonthSkin);
			this.setStyle('nextMonthOverSkin',DateChooserNextMonthSkin);
			this.setStyle('nextMonthDownSkin',DateChooserNextMonthSkin);
			this.setStyle('nextMonthDisabledSkin',DateChooserNextMonthSkin);
			
			this.setStyle('nextYearUpSkin',DateChooserNextYearSkin);
			this.setStyle('nextYearOverSkin',DateChooserNextYearSkin);
			this.setStyle('nextYearDownSkin',DateChooserNextYearSkin);
			this.setStyle('nextYearDisabledSkin',DateChooserNextYearSkin);
			
			this.setStyle('prevYearUpSkin',DateChooserPrevYearSkin);
			this.setStyle('prevYearOverSkin',DateChooserPrevYearSkin);
			this.setStyle('prevYearDownSkin',DateChooserPrevYearSkin);
			this.setStyle('prevYearDisabledSkin',DateChooserPrevYearSkin);
			
		}
		
		
		private function formatDate(currentDate:Date):String
			
		{
			
			if (!chooser)
				
			{
				
				chooser=this.dropdown as MyDateChooser;
				
			}
			
			if (currentDate)
				
			{
				
				if (chooser.times.nmsHour)
					
				{
					
					currentDate.hours=chooser.times.nmsHour.value;
					
					currentDate.minutes=chooser.times.nmsMinute.value;
					
					currentDate.seconds=chooser.times.nmsSecond.value;
					
				}
				
			}
			
			
			
			var df:DateFormatter=new DateFormatter();
			
			df.formatString="YYYY-MM-DD JJ:NN:SS";
			
			
			var times:String=df.format(currentDate);
			
			return times;
			
		}
		
		
		/**
		 
		 * 时间值变化监听函数
		 
		 * 单击日期值不关闭datechooser
		 
		 */
		
		private function onChange(event:CalendarLayoutChangeEvent):void
			
		{
			
			this.open();
			
			this.labelFunction = formatDate;
			
		}
		
		/**
		 
		 * DateChooser显示监听
		 
		 * 检查DateChooser的显示位置，如果为窗口遮挡则移动它的位置
		 
		 */
		
		private function checkDateChooserPosition(event:DropdownEvent):void{
			
			var dateChooser:DateChooser = this.dropdown as DateChooser;
			
			if(dateChooser.y<0){
				
				dateChooser.move(dateChooser.x,0);
				
			}
			
		}
		
	}
	
}