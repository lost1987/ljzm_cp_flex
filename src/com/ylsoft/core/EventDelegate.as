package com.ylsoft.core
{
	import flash.events.Event;
	
	import mx.controls.Alert;

	//事件多参数传递
	public class EventDelegate
	{
		public function EventDelegate()
		{
		}
		
		public static function create(f:Function,...args):Function{
			return function(e:Event):void{
				f.apply(null,[e].concat(args));
			}
		}
		
		public static function createWithoutEvent(f:Function,...args):Function{
			return function():void{
				f.apply(null,args);
			}
		}
	}
}

/***
**
 ** stage.addEventListener(MouseEvent.MOUSE_DOWN,EventDelegate.create(mouseDownHandler,"a","b"));
 * 
 *   function mouseDownHandler(e:MouseEvent,...arg) {  
	  trace(e)  
	  trace(arg)  
	  }  
 **/