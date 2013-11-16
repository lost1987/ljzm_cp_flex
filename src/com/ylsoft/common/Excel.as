package com.ylsoft.common
{
	import com.ylsoft.core.AppConfig;
	
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	
	import mx.controls.DataGrid;
	import mx.controls.dataGridClasses.DataGridBase;
	import mx.controls.dataGridClasses.DataGridColumn;
	import mx.core.RuntimeDPIProvider;
	
	import spark.components.DataGrid;
	import spark.components.gridClasses.GridColumn;

	public class Excel
	{
		private var _module_key:String;
		private var _start_time:String;
		private var _end_time:String;
		private var _server_id:String;
		private var _address:String;
		private var _excel_name:String;
		private var _columnsNames:String;
		private var _columnsKeys:String;
		private static var instance:Excel = null;
		private var _variables:URLVariables;
		
		public function Excel(inner:InnerClass){}
		
		public function get variables():URLVariables
		{
			return _variables;
		}

		public function set variables(value:URLVariables):void
		{
			_variables = value;
		}

		private function get columnsKeys():String
		{
			return _columnsKeys;
		}

		private function set columnsKeys(value:String):void
		{
			_columnsKeys = value;
		}

		private function get columnsNames():String
		{
			return _columnsNames;
		}

		private function set columnsNames(value:String):void
		{
			_columnsNames = value;
		}

		public function get excel_name():String
		{
			return _excel_name;
		}

		public function set excel_name(value:String):void
		{
			_excel_name = value;
		}

		public function get address():String
		{
			return _address;
		}

		public function set address(value:String):void
		{
			_address = value;
		}


		public function set dgcolumns(dg:Object):void
		{
			var columns:Array = [];
			var keys:Array = [];
			
			if(dg is mx.controls.DataGrid){
				dg = dg as mx.controls.DataGrid;
				for(var i:int = 0 ; i< dg.columns.length;i++){
					var datagridColumn : DataGridColumn  = dg.columns[i] as DataGridColumn;
					if(datagridColumn.dataField != 'select' && datagridColumn.headerText != 'id' ){
						columns.push(datagridColumn.headerText);
						keys.push(datagridColumn.dataField);
					}
				}
			}
			else{
				dg = dg as spark.components.DataGrid;
				for each(var gridColumn:GridColumn in dg.columns){
					if(gridColumn.dataField != 'select' && gridColumn.headerText != 'id' ){
						columns.push(gridColumn.headerText);
						keys.push(gridColumn.dataField);
					}
				}
			}
			
			
			this._columnsNames = columns.join('|');
			this._columnsKeys =  keys.join('|');
		}
		
		public function get server_id():String
		{
			return _server_id;
		}

		public function set server_id(value:String):void
		{
			_server_id = value;
		}

		public function get end_time():String
		{
			return _end_time;
		}

		public function set end_time(value:String):void
		{
			_end_time = value;
		}

		public function get start_time():String
		{
			return _start_time;
		}

		public function set start_time(value:String):void
		{
			_start_time = value;
		}

		public function get module_key():String
		{
			return _module_key;
		}

		public function set module_key(value:String):void
		{
			_module_key = value;
		}

		public static function getInstance():Excel{
			 if(instance == null){
				 instance = new Excel(new InnerClass);
			 }
			 return instance;
		}
		
		public function httpBuildQuery():Excel{
			if( Toolkit.blankClear(this._module_key) == '' ||
				Toolkit.blankClear(this._columnsNames) == ''  ||
				Toolkit.blankClear(this._columnsKeys) == ''  ||
				Toolkit.blankClear(this._server_id) == ''  ||
				Toolkit.blankClear(this._address) == '')
				throw new Error('调用参数不全,请参考Excel类的参数调用.');
				
			this._variables = new URLVariables();
			_variables.excel_name = this._excel_name;
			_variables.module_key = this._module_key;
			_variables.columnNames = this._columnsNames;
			_variables.columnKeys = this._columnsKeys;
			_variables.server_id = this._server_id;
			_variables.start_time = this._start_time;
			_variables.end_time = this._end_time;
			
			return instance;
		}
		
		public function makeExcel():void{
			var req : URLRequest = new URLRequest(this._address);
			req.data = this._variables;
			req.method = URLRequestMethod.POST;
			navigateToURL(req,"_blank");
		}
	}
}

class InnerClass{}