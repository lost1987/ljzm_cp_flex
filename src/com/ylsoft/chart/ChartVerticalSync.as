package com.ylsoft.chart
{		
	import flash.events.Event;
	
	import mx.charts.ChartItem;
	import mx.charts.chartClasses.ChartBase;
	import mx.charts.chartClasses.Series;
	import mx.charts.events.ChartItemEvent;
	import mx.charts.series.LineSeries;
	import mx.charts.series.items.LineSeriesItem;
	import mx.collections.ArrayCollection;

	/**
	 * 
	 * @author lost
	 * 鼠标移动时,使linechart的Y轴多条series数据同时显示
	 */
	public class ChartVerticalSync
	{

		
		private var _chart:ChartBase;
		private var _sourceData:ArrayCollection;//图表的数据源,也就是dataprovider
		private var _series:Array;
		
		public function ChartVerticalSync()
		{
		}
		
		public function init(chart:ChartBase):void{
			this._chart = chart;
			this._sourceData = new ArrayCollection(chart.dataProvider as Array);
			this._series = chart.series;
			
			this._chart.showDataTips = true;
			
			if(_chart.hasEventListener(ChartItemEvent.ITEM_ROLL_OVER))_chart.removeEventListener(ChartItemEvent.ITEM_ROLL_OVER,showVerticalDataTip);
			if(_chart.hasEventListener(ChartItemEvent.ITEM_ROLL_OUT))_chart.removeEventListener(ChartItemEvent.ITEM_ROLL_OUT,removeVerticalDataTip);
			_chart.addEventListener(ChartItemEvent.ITEM_ROLL_OVER,showVerticalDataTip);
			_chart.addEventListener(ChartItemEvent.ITEM_ROLL_OUT,removeVerticalDataTip);
		}
		
		private function showVerticalDataTip(evt:ChartItemEvent):void{
			var item:ChartItem = evt.hitData.chartItem;
			var idx :int = item.index;
			var data:Object = this._sourceData.getItemAt(idx);
			for each(var s:ChartLineSeries in this._series){
				s.addDataTip(data, idx);
			}
		}
		
		private function removeVerticalDataTip(evt:ChartItemEvent):void{
			for each(var s:ChartLineSeries in _series)
			{
				s.removeDataTip();
			}
		}
		
	}
}