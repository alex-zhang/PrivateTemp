package com.alex.myHungryHero.scene
{
	import com.alex.myHungryHero.scene.entities.BackgroundEntity;
	import com.alex.myHungryHero.scene.entities.BgLayer;
	import com.croco2dMGE.world.SceneLayer;
	
	import starling.core.Starling;
	import starling.display.Stage;
	import starling.events.Event;

	public class GameBackgroundLayer extends SceneLayer
	{
		public var speed:Number = 0.0;
		
		private var bgLayer1:BgLayer;
		private var bgLayer2:BgLayer;
		private var bgLayer3:BgLayer;
		private var bgLayer4:BgLayer;
		
		public function GameBackgroundLayer()
		{
			super();
		}
		
		override protected function onInit():void
		{
			super.onInit()
				
			needDepthsort = false;
			needRealTimeDepthSort = false;
			
			//-
			bgLayer1 = new BgLayer(1);
			bgLayer1.parallaxDepth = 0.02;
			
			var bglayer1Entity:BackgroundEntity = new BackgroundEntity();
			bglayer1Entity.displayObject = bgLayer1;
			addItem(bglayer1Entity);
			bgLayer1.dispatchEvent(new Event(Event.ADDED_TO_STAGE));
			
			//
			
			bgLayer2 = new BgLayer(2);
			bgLayer2.parallaxDepth = 0.2;
			
			var bglayer2Entity:BackgroundEntity = new BackgroundEntity();
			bglayer2Entity.displayObject = bgLayer2;
			addItem(bglayer2Entity);
			bgLayer2.dispatchEvent(new Event(Event.ADDED_TO_STAGE));
			
			//
			
			bgLayer3 = new BgLayer(3);
			bgLayer3.parallaxDepth = 0.5;
			
			var bglayer3Entity:BackgroundEntity = new BackgroundEntity();
			bglayer3Entity.displayObject = bgLayer3;
			addItem(bglayer3Entity);
			bgLayer3.dispatchEvent(new Event(Event.ADDED_TO_STAGE));
			
			//
			bgLayer4 = new BgLayer(4);
			bgLayer4.parallaxDepth = 1;
			
			var bglayer4Entity:BackgroundEntity = new BackgroundEntity();
			bglayer4Entity.displayObject = bgLayer4;
			addItem(bglayer4Entity);
			bgLayer4.dispatchEvent(new Event(Event.ADDED_TO_STAGE));
		}
		
		override public function tick(deltaTime:Number):void
		{
			super.tick(deltaTime);
			
			var stage:Stage = Starling.current.stage;
			
			// Background 1 - Sky
			bgLayer1.x -= Math.ceil(speed * bgLayer1.parallaxDepth);
			// Hero flying left
			if (bgLayer1.x > 0) bgLayer1.x = -stage.stageWidth;
			// Hero flying right
			if (bgLayer1.x < -stage.stageWidth ) bgLayer1.x = 0;
			
			// Background 2 - Hills
			bgLayer2.x -= Math.ceil(speed * bgLayer2.parallaxDepth);
			// Hero flying left
			if (bgLayer2.x > 0) bgLayer2.x = -stage.stageWidth;
			// Hero flying right
			if (bgLayer2.x < -stage.stageWidth ) bgLayer2.x = 0;
			
			// Background 3 - Buildings
			bgLayer3.x -= Math.ceil(speed * bgLayer3.parallaxDepth);
			// Hero flying left
			if (bgLayer3.x > 0) bgLayer3.x = -stage.stageWidth;
			// Hero flying right
			if (bgLayer3.x < -stage.stageWidth ) bgLayer3.x = 0;
			
			// Background 4 - Trees
			bgLayer4.x -= Math.ceil(speed * bgLayer4.parallaxDepth);
			// Hero flying left
			if (bgLayer4.x > 0) bgLayer4.x = -stage.stageWidth;
			// Hero flying right
			if (bgLayer4.x < -stage.stageWidth ) bgLayer4.x = 0;
		}
	}
}
