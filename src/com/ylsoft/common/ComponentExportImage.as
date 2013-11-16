package com.ylsoft.common
{
	/**
	 * 
	 * 
	 * 将UIComponent组件或子类导出成图片 
	 * 
	 * */
	import com.adobe.images.JPGEncoder;
	import com.ylsoft.core.AppConfig;
	
	import flash.display.BitmapData;
	import flash.net.FileReference;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.navigateToURL;
	import flash.utils.ByteArray;
	
	import mx.core.UIComponent;
	
	public class ComponentExportImage
	{
		
		private static var instance:ComponentExportImage;
		public var ui_target:UIComponent;//将要被转换成图片的可视组件
		public var save_name:String; //保存的名字
		
		public function ComponentExportImage(inner:InnerClass){}
		
		public static function getInstance():ComponentExportImage{
			if(instance == null){
				instance = new ComponentExportImage(new InnerClass());
			}
			return instance;
		}
		
		public function getJPGByteArray():ByteArray{
			if(this.ui_target == null)throw new Error('要转换的组件不能为null');
			
			var data:BitmapData = new BitmapData(this.ui_target.width,this.ui_target.height);
			data.draw(ui_target);
			
			var encoder : JPGEncoder = new JPGEncoder(100);
			return encoder.encode(data);
		}
		
		public function saveLocal():void{
			var bytes:ByteArray = this.getJPGByteArray();
			var fr:FileReference = new FileReference;
			fr.save(bytes,save_name + new Date().time.toString() +'.jpg');
		}
		
	}
}

class InnerClass{}