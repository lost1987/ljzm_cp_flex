package com.ylsoft.event
{
	import flash.events.Event;
	
	public class AppEvent extends Event
	{
		
		public static const AMF_GLOABAL_COMPLETE : String = 'amf_gloabal_complete';
		
		public static const AMF_GLOABAL_FAULT : String = 'amf_gloable_fault';
		
		public static const UIREMOTEOBJECT_SEND:String  = 'uiremoteobject_send';
		
		public static const UIREMOTEOBJECT_FINISH:String = 'uiremoteobject_finish';
		
		public static const CHKDATAGRID_CHECKED_CHANGE :String = 'chkdatagrid_checked_change';
		
		public static const EXCEL_EXPORT_READY : String = 'excel_export_ready';
		
		public static const COMPONENT_EXPORT_IMAGE_READY : String = 'component_export_image_ready';
		
		public static const MUTI_CUS_BUISSNESSER_CHOOSER_READY : String = 'muti_cus_buissnesser_chooser_ready';
		
		public static const SINGLE_CUS_BUISSNESSER_CHOOSER_READY : String = 'single_cus_buissnesser_chooser_ready';
		
		public static const BUISSNESSER_CHOOSE_COMPLETE : String = 'buissnesser_choose_complete';
		
		public static const BUISSNESSER_CHOOSER_CUS_MUTI_COMPLETE:String = 'buissnesser_chooser_cus_muti_complete';
		
		public static const BUISSNESSER_CHOOSER_CUS_SINGLE_COMPLETE:String = 'buissnesser_chooser_cus_single_complete';
		
		public static const LOG_TYPE_SELECT_COMPLETE:String = 'log_type_select_complete';
		
		public function AppEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}