package com.ylsoft.chart
{
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.charts.chartClasses.ChartBase;
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

	/***
	 * 主要适用于linechart
	 * 图表拖拽的数据类 支持左右拖动
	 * 一张图表 有且只能new一次这个类 否则会数据混乱 应该是监听器重复绑定 解除不成功造成的现象
	 * */
	public class ChartDrag
	{
		
	    public var _item_num:int; //图表要显示的数据数量
		public var _tempData:ArrayCollection; //图表要显示的临时数据
		public var _totalData:ArrayCollection;//图表的总数据
		private var _oldX:Number,_oldY:Number;//事件触发的X轴和Y轴
		private var _firstIndex:int, _lastIndex:int;//数据的索引
		private var _chart:ChartBase;//要操控的图表对象
		private var _dragSpeed:int = 100; //拖动的速度
		//操作方式
		private var _operation_type:String;
		public static const OPERATION_MOUSE:String = 'mouse';
		public static const OPERATION_KEYBOARD:String = 'keyboard';
		
		public function init(totalData:ArrayCollection,chart:ChartBase,item_num:int=5,type:String = ChartDrag.OPERATION_KEYBOARD):void{
			if(totalData == null || chart == null){
				Alert.show('总数据不能为空,图表对象不能为空');
				return;
			}
			this._operation_type = type;
			this._tempData = new ArrayCollection;
			this._item_num = item_num;
			this._totalData = totalData;
			this._chart = chart;
			this._firstIndex = 0;
			this._lastIndex = totalData.length < _item_num ? totalData.length : _item_num;
			this._oldX = 0;
			this._oldY = 0;
			this.setTempData();
			this.initChart();
			
		}
		
		
		//设定临时存储值
		public function setTempData():void{
			for(var i:int = _firstIndex ; i< _lastIndex ; i++){
				_tempData.addItem(_totalData.getItemAt(i));
			}
		}
		
		//设置图表的信息
		public function initChart():void{
		
			if(this._operation_type == ChartDrag.OPERATION_MOUSE){
				if(_chart.hasEventListener(MouseEvent.MOUSE_MOVE))_chart.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
				if(_chart.hasEventListener(MouseEvent.MOUSE_DOWN))_chart.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseDown);
				
				this._chart.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMove);
				this._chart.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDown);
			}else{
				if(_chart.hasEventListener(KeyboardEvent.KEY_DOWN))_chart.removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
				if(_chart.hasEventListener(KeyboardEvent.KEY_UP))_chart.removeEventListener(KeyboardEvent.KEY_UP,onKeyUp);
				this._chart.addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
				this._chart.addEventListener(KeyboardEvent.KEY_UP,onKeyUp);
			}
			
			this._chart.dataProvider = _tempData;
		}
		
		private function onMouseMove(evt:MouseEvent):void{
			if(evt.buttonDown){
				var addx:int = 0;
				addx = evt.stageX - _oldX;
				if(addx >= _dragSpeed){
					if(_lastIndex <= _totalData.length - 1){
						if(_firstIndex > 0)
						{
							_tempData.removeItemAt(_item_num-1);//删除临时数据的头一个数据点
							_tempData.addItemAt(_totalData.getItemAt(_firstIndex - 1),0)//增加一个新的数据点
							_firstIndex -- ;
							_lastIndex -- ;
							addx = 0;
							_oldX = evt.stageX;
							refreshChart();
						}
						else
						{
							//Alert.show("已是第一个数据点!");
						}
					}
				}else if(addx <= _dragSpeed*-1){
					if(_lastIndex < _totalData.length-1)
					{
						_tempData.removeItemAt(0);//删除临时数据的头一个数据点
						_tempData.addItem(_totalData.getItemAt(_lastIndex + 1));//增加一个新的数据点
						_firstIndex ++ ;
						_lastIndex ++ ;
						addx = 0;
						_oldX = evt.stageX;
						refreshChart();
					}
					else
					{
						//Alert.show("已是最后一个数据点!");
					}
				}
			}
		}
		
		private function onMouseDown(evt:MouseEvent):void{
			this._oldX = evt.stageX;//按下鼠标时候的X坐标
		}
		
		private function onKeyDown(evt:KeyboardEvent):void{
			this._chart.selectionMode = 'none';//将图表设为不可选 可屏蔽左右按键时 节点的逐个被选中 而可直接向右移动图表
			
			if(evt.keyCode == Keyboard.RIGHT){
				if(_lastIndex < _totalData.length-1)
				{
					_tempData.removeItemAt(0);//删除临时数据的头一个数据点
					_tempData.addItem(_totalData.getItemAt(_lastIndex + 1));//增加一个新的数据点
					_firstIndex ++ ;
					_lastIndex ++ ;
					refreshChart();
				}
				else
				{
					//Alert.show("已是最后一个数据点!");
				}
			}else if(evt.keyCode == Keyboard.LEFT){
				if(_lastIndex <= _totalData.length - 1){
					if(_firstIndex > 0)
					{
						_tempData.removeItemAt(_item_num-1);//删除临时数据的头一个数据点
						_tempData.addItemAt(_totalData.getItemAt(_firstIndex - 1),0)//增加一个新的数据点
						_firstIndex -- ;
						_lastIndex -- ;
						refreshChart();
					}
					else
					{
						//Alert.show("已是第一个数据点!");
					}
				}
			}
		}
		
		private function onKeyUp(evt:KeyboardEvent):void{
			this._chart.selectionMode = 'multiple';//重启开启图表可选设置
		}
		
		public function refreshChart():void{
			this._chart.dataProvider = this._tempData;
 		}
		
	}
}