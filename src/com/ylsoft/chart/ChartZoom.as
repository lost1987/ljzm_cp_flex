package com.ylsoft.chart
{
	import com.ylsoft.common.Toolkit;
	import com.ylsoft.core.EventDelegate;
	
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
	import mx.charts.chartClasses.ChartBase;
	import mx.charts.chartClasses.Series;
	import mx.charts.events.ChartEvent;
	import mx.charts.events.ChartItemEvent;
	import mx.charts.series.LineSeries;
	import mx.charts.series.items.LineSeriesItem;
	import mx.collections.ArrayCollection;
	import mx.controls.Alert;

	/**
	 * 
	 * @author lost
	 * 主要适用于linechart 请确认设置linechart的selectMode 为multiple 
	 * 功能:拉框放大,双击还原

	 */
	public class ChartZoom
	{
		
		private var chart:ChartBase;
		private var old_data:ArrayCollection;
		private var isZoomed:Boolean;//保证缩放了以后 才能执行reset
		private var switchZoom:Boolean=false;//缩放开关
		
		public function ChartZoom()
		{
			
		}
		
		public function init(chart:ChartBase):void{
			this.chart = chart;
			this.chart.selectionMode = 'multiple';
			this.chart.doubleClickEnabled = true;
			this.old_data = this.chart.dataProvider as ArrayCollection;
			var lineSeries:Array = this.chart.series;//清空lineseries 防止重新请求数据也就是刷新dataprovider以后造成数据混乱
			for(var i:int = 0; i< lineSeries.length ; i++){
				var ls:LineSeries = lineSeries[i] as LineSeries;
				ls.dataProvider = this.old_data;
			}
			
			if(this.chart.hasEventListener(Event.CHANGE))this.chart.removeEventListener(ChartItemEvent.CHANGE,zoom);
			if(this.chart.hasEventListener(ChartEvent.CHART_DOUBLE_CLICK))this.chart.removeEventListener(ChartEvent.CHART_DOUBLE_CLICK,reset);
			if(this.chart.hasEventListener(KeyboardEvent.KEY_DOWN))this.chart.removeEventListener(KeyboardEvent.KEY_DOWN,seriesFindDataPointDisabled);
			//if(this.chart.hasEventListener(KeyboardEvent.KEY_UP))this.chart.removeEventListener(KeyboardEvent.KEY_UP,seriesFindDataPointEnabled);
		    this.chart.addEventListener(ChartItemEvent.CHANGE,zoom);
			this.chart.addEventListener(ChartEvent.CHART_DOUBLE_CLICK,reset);
			this.chart.addEventListener(KeyboardEvent.KEY_DOWN,seriesFindDataPointDisabled);
			//this.chart.addEventListener(KeyboardEvent.KEY_UP,seriesFindDataPointEnabled);
		}
		
		
		private function zoom(evt:Event):void{
			var chartSel : ArrayCollection = new ArrayCollection(this.chart.selectedChartItems);
			if(chartSel.length > 1){//单个点缩放无意义 所以这里是大于1
				for each(var ls:LineSeries in this.chart.series){
					var temp:ArrayCollection = new ArrayCollection;
					for each(var lineitem:LineSeriesItem in chartSel){
						temp.addItem(lineitem.item);
					}
					ls.dataProvider = temp;
				}
				this.chart.clearSelection();
				this.isZoomed = true;
			}
		}
		
		private function reset(evt:ChartEvent):void{
			if(isZoomed){
				var lineSeries:Array = this.chart.series;
				for(var i:int = 0; i< lineSeries.length ; i++){
					var ls:LineSeries = lineSeries[i] as LineSeries;
					ls.dataProvider = this.old_data;
				}
				this.isZoomed = false;
			}
		}
		
		private function seriesFindDataPointDisabled(evt:KeyboardEvent):void{
			if(evt.keyCode == Keyboard.SHIFT){
				if(this.switchZoom)this.switchZoom=false;
				else this.switchZoom=true;
				
				if(this.switchZoom){
						for each(var s:ChartLineSeries in this.chart.series){
							s.disabled = true;
						}
				}else{
						for each(s in this.chart.series){
							s.disabled = false;
						}
				}
			}
		}
		
	/*	private function seriesFindDataPointEnabled(evt:KeyboardEvent):void{
			if(evt.keyCode == Keyboard.SHIFT){
				for each(var s:ChartLineSeries in this.chart.series){
					s.disabled = false;
				}
			}
		}*/
		
		
	}
}