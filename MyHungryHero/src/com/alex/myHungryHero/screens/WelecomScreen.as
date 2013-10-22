package com.alex.myHungryHero.screens
{
	import com.fireflyLib.core.SystemGlobal;
	
	import flash.utils.getTimer;
	
	import feathers.controls.Screen;
	
	import starling.animation.IAnimatable;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Image;
	import starling.events.Event;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;

	public class WelecomScreen extends Screen implements IAnimatable
	{
		/** Background image. */
		public var bg:Image;
		
		/** Game title. */
		public var title:Image;
		
		/** Play button. */
		public var playBtn:Button;
		
		/** About button. */
		public var aboutBtn:Button;
		
		/** Hero artwork. */
		public var hero:Image;
		
		/** Hero art tween object. */
		private var tween_hero:Tween;
		
		public function WelecomScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			var assetManager:AssetManager = AssetManager(SystemGlobal.get("AssetManager"));
			var textureAtlas:TextureAtlas = assetManager.getTextureAtlas("mySpritesheet");
			
			// GENERAL ELEMENTS
			bg = new Image(assetManager.getTexture("bgWelcome"));
			bg.blendMode = BlendMode.NONE;
			this.addChild(bg);
			
			title = new Image(textureAtlas.getTexture("welcome_title"));
			title.x = 600;
			title.y = 65;
			this.addChild(title);
			
			// WELCOME ELEMENTS
			hero = new Image(textureAtlas.getTexture("welcome_hero"));
			hero.x = -hero.width;
			hero.y = 130;
			this.addChild(hero);
			
			playBtn = new Button(textureAtlas.getTexture("welcome_playButton"));
			playBtn.x = 640;
			playBtn.y = 340;
			this.addChild(playBtn);
			
			aboutBtn = new Button(textureAtlas.getTexture("welcome_aboutButton"));
			aboutBtn.x = 460;
			aboutBtn.y = 460;
			this.addChild(aboutBtn);
			
			Starling.juggler.add(this);
			
			tween_hero = new Tween(hero, 4, Transitions.EASE_OUT);
			tween_hero.animate("x", 80);
			Starling.juggler.add(tween_hero);
		}
		
		override protected function screen_addedToStageHandler(event:Event):void
		{
			super.screen_addedToStageHandler(event);
			
			if(isInitialized)
			{
				Starling.juggler.add(this);
				Starling.juggler.add(tween_hero);
			}
		}
		
		public function advanceTime(passedTime:Number):void
		{
			var time:int = getTimer();
			
			hero.y = 130 + (Math.cos(time * 0.002)) * 25;
			playBtn.y = 340 + (Math.cos(time * 0.002)) * 10;
			aboutBtn.y = 460 + (Math.cos(time * 0.002)) * 10;
		}
		
		override protected function screen_removedFromStageHandler(event:Event):void
		{
			super.screen_removedFromStageHandler(event);
			
			if(isInitialized)
			{
				Starling.juggler.remove(this);
				Starling.juggler.remove(tween_hero);
			}
		}
	}
}