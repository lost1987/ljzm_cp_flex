package com.ylsoft.common
{
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.Label;
	import mx.controls.LinkButton;
	import mx.controls.NumericStepper;
	import mx.controls.TextInput;
	import mx.events.CalendarLayoutChangeEvent;
	import mx.events.FlexEvent;
	import mx.events.NumericStepperEvent;
	
	/**
	 *  
	 *  重写了的HBox
	 *  实现时分秒的选择
	 *
	 */
	public class MyTimeChooser extends VBox
	{
		public var labHour:Label;
		public var labMinute:Label;
		public var labSecond:Label;
		
		public var nmsHour:NumericStepper;
		public var nmsMinute:NumericStepper;
		public var nmsSecond:NumericStepper;
		/** 时间显示格式  */
		private var dateFormatString:String="YYYY-MM-DD JJ:NN:SS";
		//时分秒容器
		private var timeHbox:HBox;
		//按钮容器
		private var btnHbox:HBox;
		//清空按钮206
		private var clearBtn:LinkButton;
		//确定按钮
		private var sureBtn:LinkButton;
		
		public function MyTimeChooser()
		{
			super();
			this.width=240;
			this.height=70;
			this.setStyle("horizontalGap", "0");
			this.setStyle("verticalGap", "5");
			this.setStyle("horizontalScrollPolicy","off");
			this.setStyle("verticalScrollPolicy","off");
			this.addEventListener(MouseEvent.CLICK, displayChooser);
		}
		
		protected override function createChildren():void
		{
			super.createChildren();
			if (!timeHbox)
			{
				timeHbox=new HBox();
				timeHbox.percentWidth = 100;
				this.setStyle("verticalGap", "0");
			}
			if (!btnHbox)
			{
				btnHbox=new HBox();
				btnHbox.percentWidth = 100;
				btnHbox.setStyle("paddingTop","5");
				btnHbox.setStyle("horizontalGap", "30");
				btnHbox.setStyle("horizontalAlign", "center");
			}
			if (!nmsHour)
			{
				nmsHour=new NumericStepper();
				nmsHour.width=45;
				nmsHour.height=18;
				nmsHour.minimum=0;
				nmsHour.maximum=23;
				nmsHour.setStyle("fontSize", "12");
				nmsHour.addEventListener(MouseEvent.CLICK, displayChooser);
				nmsHour.addEventListener(NumericStepperEvent.CHANGE, numChange);
				nmsHour.addEventListener(FocusEvent.FOCUS_IN, stopClick);
				timeHbox.addChild(nmsHour);
			}
			if (!labHour)
			{
				labHour=new Label();
				labHour.text=":时";
				timeHbox.addChild(labHour);
			}
			
			if (!nmsMinute)
			{
				nmsMinute=new NumericStepper();
				nmsMinute.width=45;
				nmsMinute.height=18;
				nmsMinute.minimum=0;
				nmsMinute.maximum=59;
				nmsMinute.setStyle("fontSize", "12");
				nmsMinute.addEventListener(MouseEvent.CLICK, displayChooser);
				nmsMinute.addEventListener(NumericStepperEvent.CHANGE, numChange);
				nmsMinute.addEventListener(FocusEvent.FOCUS_IN, stopClick);
				timeHbox.addChild(nmsMinute);
			}
			if (!labMinute)
			{
				labMinute=new Label();
				labMinute.text=":分";
				timeHbox.addChild(labMinute);
			}
			
			
			if (!nmsSecond)
			{
				nmsSecond=new NumericStepper();
				nmsSecond.width=45;
				nmsSecond.height=18;
				nmsSecond.minimum=0;
				nmsSecond.maximum=59;
				nmsSecond.setStyle("fontSize", "12");
				nmsSecond.addEventListener(MouseEvent.CLICK, displayChooser);
				nmsSecond.addEventListener(NumericStepperEvent.CHANGE, numChange);
				nmsSecond.addEventListener(FocusEvent.FOCUS_IN, stopClick);
				timeHbox.addChild(nmsSecond);
			}
			if (!labSecond)
			{
				labSecond=new Label();
				labSecond.text=":秒";
				timeHbox.addChild(labSecond);
			}
			if (!clearBtn)
			{
				clearBtn=new LinkButton();
				clearBtn.label="清空";
				clearBtn.setStyle("styleName","btnRemoveOrg");
				clearBtn.addEventListener(MouseEvent.CLICK, clearDate);
				btnHbox.addChild(clearBtn);
			}
			if (!sureBtn)
			{
				sureBtn=new LinkButton();
				sureBtn.label="确定";
				sureBtn.setStyle("styleName","btnOk");
				sureBtn.addEventListener(MouseEvent.CLICK, closeDateChooser);
				btnHbox.addChild(sureBtn);
			}
			this.addChild(timeHbox);
			this.addChild(btnHbox);
		}
		
		/**
		 * 单击NumericStepper时显示datechooser
		 *
		 */
		private function displayChooser(event:MouseEvent):void
		{
			if (this.parent is MyDateChooser)
			{
				var dateChooser:MyDateChooser=this.parent as MyDateChooser;
				if (dateChooser.owner is MyDateField)
				{
					var dateField:MyDateField=dateChooser.owner as MyDateField;
					dateField.open();
					if (event.currentTarget is NumericStepper)
					{
						(event.currentTarget as NumericStepper).removeEventListener(MouseEvent.CLICK, displayChooser);
					}
					if (event.currentTarget is MyTimeChooser)
					{
						this.removeEventListener(MouseEvent.CLICK, displayChooser);
					}
					
				}
			}
		}
		
		/**
		 * 时分秒值改变时通知DateFiled修改显示值
		 *
		 */
		private function numChange(event:NumericStepperEvent):void
		{
			if (this.parent is MyDateChooser)
			{
				var dateChooser:MyDateChooser=this.parent as MyDateChooser;
				if (dateChooser.owner is MyDateField)
				{
					var dateField:MyDateField=dateChooser.owner as MyDateField;
					if (dateField.selectedDate)
					{
						var orginDate:Date=dateField.selectedDate
						orginDate.hours=nmsHour.value;
						orginDate.minutes=nmsMinute.value;
						orginDate.seconds=nmsSecond.value;
						dateField.dispatchEvent(new CalendarLayoutChangeEvent(CalendarLayoutChangeEvent.CHANGE));
					}
				}
			}
		}
		
		/**
		 * 点击NumericStepper里的TextInput时显示datechooser
		 *
		 */
		private function stopClick(event:FocusEvent):void
		{
			if (this.parent is MyDateChooser)
			{
				var dateChooser:MyDateChooser=this.parent as MyDateChooser;
				if (dateChooser.owner is MyDateField)
				{
					var dateField:MyDateField=dateChooser.owner as MyDateField;
					if (dateField)
					{
						dateField.open();
					}
				}
			}
		}
		
		/**
		 *取当前MyDateField
		 */
		private function getMyDateField():MyDateField
		{
			if (this.parent is MyDateChooser)
			{
				var dateChooser:MyDateChooser=this.parent as MyDateChooser;
				if (dateChooser.owner is MyDateField)
				{
					var dateField:MyDateField=dateChooser.owner as MyDateField;
					return dateField;
					
				}
			}
			return null;
		}
		
		/**
		 * 清空时间
		 */
		private function clearDate(event:MouseEvent):void
		{
			var myDateField:MyDateField=getMyDateField();
			if (myDateField)
			{
				myDateField.selectedDate=null;
				myDateField.dispatchEvent(new CalendarLayoutChangeEvent(CalendarLayoutChangeEvent.CHANGE));
			}
		}
		/**
		 * 关闭时间控件
		 */
		private function closeDateChooser(event:MouseEvent):void
		{
			var myDateField:MyDateField=getMyDateField();
			if (myDateField)
			{
				//发送关闭datechooser的事件
				myDateField.dispatchEvent(new Event(Event.REMOVED_FROM_STAGE));
				textChange();
			}
		}
		/**
		 * 检查textInput值变化
		 */
		private function textChange():void
		{
			var myDateField:MyDateField=getMyDateField();
			if (myDateField)
			{
				if (myDateField.selectedDate)
				{
					var orginDate:Date=myDateField.selectedDate
					orginDate.hours=nmsHour.value;
					orginDate.minutes=nmsMinute.value;
					orginDate.seconds=nmsSecond.value;
					myDateField.dispatchEvent(new CalendarLayoutChangeEvent(CalendarLayoutChangeEvent.CHANGE));
				}
			}
		}
	}
}