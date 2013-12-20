package com.ylsoft.common
{
	import mx.core.UIComponent;
	import mx.effects.Blur;
	import mx.effects.Fade;
	import mx.effects.Parallel;
	import mx.events.EffectEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.TitleWindow;
	import spark.effects.Scale;

	public class XWindow
	{
		
		private var showEffects:Parallel;
		private var closeEffects:Parallel;
		
		private var content:UIComponent;
		private var parent:UIComponent;
		
		private static var instance:XWindow;
		
		public function XWindow(inner:InnerClass){}
		
		public static function getInstance():XWindow{
			if(instance == null){
				instance = new XWindow(new InnerClass);
			}
			return instance;
		}
		
		
		private function initEffects():void{
			var d:int=400;
			             
            this.showEffects=new Parallel();
            var scale:Scale=new Scale();
            scale.autoCenterTransform=true;
            scale.scaleXFrom=scale.scaleYFrom=0.8;
            scale.scaleXTo=scale.scaleYTo=1;
            scale.duration=d;
             
            var fade:Fade=new Fade();
            fade.alphaFrom=0;
            fade.alphaTo=1;
            fade.duration=d;
			
			var blur:Blur = new Blur();
			blur.blurXFrom = blur.blurYFrom = 100;
			blur.blurXTo = blur.blurYTo = 1;
			             
            this.showEffects.addChild(fade);
            this.showEffects.addChild(scale);
			this.showEffects.addChild(blur);
 //           this.showEffects.addEventListener(EffectEvent.EFFECT_END,showEffectsEnd);
 //           this.showEffects.addEventListener(EffectEvent.EFFECT_START,showEffectsStarted);
             
             
            d=200;
            this.closeEffects=new Parallel();
            scale=new Scale();
            scale.autoCenterTransform=true;
            scale.scaleXFrom=scale.scaleYFrom=1;
            scale.scaleXTo=scale.scaleYTo=0.8;
            scale.duration=d;
             
            fade=new Fade();
            fade.alphaFrom=1;
            fade.alphaTo=0;
            fade.duration=d;
             
            this.closeEffects.addChild(scale);
            this.closeEffects.addChild(fade);
		}
		
		
		public function addWindow(content:UIComponent,parent:UIComponent):XWindow{
			this.content = content;
			this.parent = parent;
			return this;
		}
		
		public function show():void{
			this.initEffects();
			PopUpManager.addPopUp(content,parent,true);
			PopUpManager.centerPopUp(content);
			this.showEffects.target = content;
			this.showEffects.play();
		}
		
      //  private function showEffectsStarted(e:EffectEvent):void{
      //  }
         
      //  private function showEffectsEnd(e:EffectEvent):void{
	           
      //  }
	}
}

class InnerClass{}