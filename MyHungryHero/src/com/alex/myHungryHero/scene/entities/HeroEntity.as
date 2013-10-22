package com.alex.myHungryHero.scene.entities
{
	import com.croco2dMGE.CrocoEngine;
	import com.croco2dMGE.utils.CrocoRect;
	import com.croco2dMGE.world.SceneEntity;
	import com.fireflyLib.core.SystemGlobal;
	
	import starling.core.RenderSupport;
	import starling.display.MovieClip;
	import starling.extensions.PDParticleSystem;
	import starling.textures.Texture;
	import starling.utils.AssetManager;

	public class HeroEntity extends SceneEntity
	{
		private var heroDisplay:MovieClip;
		private var particle:PDParticleSystem;
		
		public var state:int;
		
		public function HeroEntity()
		{
			super();
		}
		
		public function setHeroAnimationSpeed(speed:int):void {
			if (speed == 0) heroDisplay.fps = 20;
			else heroDisplay.fps = 60;
		}
		
		override protected function onInit():void
		{
			var assetManager:AssetManager = AssetManager(SystemGlobal.get("AssetManager"));
			var result:Vector.<Texture> = assetManager.getTextures("fly_");
			
			heroDisplay = new MovieClip(result, 20); 
			
			var heroWidth:int = heroDisplay.width;
			var heroheight:int = heroDisplay.height;
			
			var halfHeroWidth:int = int(heroDisplay.width * 0.5);
			var halfHeroHeight:int = int(heroDisplay.height * 0.5);
			
			heroDisplay.pivotX = halfHeroWidth;
			heroDisplay.pivotY = halfHeroHeight;
			
			displayObject = heroDisplay;
			
			particle = new PDParticleSystem(assetManager.getXml("particle"), assetManager.getTexture("texture"));
			particle.start();
			
			visibleTestRect = new CrocoRect(-halfHeroWidth, -halfHeroHeight, heroWidth, heroheight)
		}
		
		override protected function presentDisplayObject(support:RenderSupport, parentAlpha:Number):void
		{
			super.presentDisplayObject(support, parentAlpha);
			
//			var blendMode:String = support.blendMode;
			
//			support.pushMatrix();
//			support.transformMatrix(particle);
//			support.blendMode = particle.blendMode;
			
			particle.render(support, parentAlpha);
			
//			support.blendMode = blendMode;
//			support.popMatrix();
		}
		
		override protected function drawDisplayObject():void
		{
			super.drawDisplayObject();
			
			particle.emitterX = heroDisplay.x;
			particle.emitterY = heroDisplay.y;
			
			heroDisplay.advanceTime(CrocoEngine.deltaTime);
			particle.advanceTime(CrocoEngine.deltaTime);
		}
		
		override public function dispose():void
		{
			super.dispose();
			
			if(heroDisplay)
			{
				heroDisplay.dispose();
				heroDisplay = null;
			}
		}
	}
}