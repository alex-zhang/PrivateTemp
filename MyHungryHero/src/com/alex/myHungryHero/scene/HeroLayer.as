package com.alex.myHungryHero.scene
{
	import com.alex.myHungryHero.scene.entities.HeroEntity;
	import com.croco2dMGE.world.SceneLayer;
	
	import starling.core.RenderSupport;

	public class HeroLayer extends SceneLayer
	{
		public var heroEntity:HeroEntity;
		
		public function HeroLayer()
		{
			super();
		}
		
		override protected function onInit():void
		{
			super.onInit();
			
			heroEntity = new HeroEntity();
			addItem(heroEntity);
		}
		
		override public function draw(support:RenderSupport, parentAlpha:Number):void
		{
			super.draw(support, parentAlpha);
		}
	}
}