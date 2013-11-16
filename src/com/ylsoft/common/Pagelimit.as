package com.ylsoft.common
{
	public class Pagelimit
	{
		
		public var start:Number;
		public var limit:Number;
		
		public function Pagelimit(start:Number = 0,limit:Number = 10)
		{
			this.start = start;
			this.limit = limit;
		}
	}
}