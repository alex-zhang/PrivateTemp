package com.alex.myHungryHero.screens
{
	import com.fireflyLib.core.SystemGlobal;
	
	import feathers.controls.Screen;
	
	import starling.display.BlendMode;
	import starling.display.Button;
	import starling.display.Image;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class AboutScreen extends Screen
	{
		/** Background image. */
		public var bg:Image;
		
		/** About text field. */
		public var aboutText:TextField;
		
		/** hsharma.com button. */
		public var hsharmaBtn:Button;
		
		/** Starling Framework button. */
		public var starlingBtn:Button;
		
		/** Back button. */
		public var backBtn:Button;
		
		public function AboutScreen()
		{
			super();
			
			trace("asdasdasd")
		}
		
		override protected function initialize():void
		{
			var assetManager:AssetManager = AssetManager(SystemGlobal.get("AssetManager"));
			var textureAtlas:TextureAtlas = assetManager.getTextureAtlas("mySpritesheet");
			
			bg = new Image(assetManager.getTexture("bgWelcome"));
			bg.blendMode = BlendMode.NONE;
			this.addChild(bg);
			
			var aboutValue:String = "Hungry Hero is a free and open source game built on Adobe Flash using Starling Framework.\n\nhttp://www.hungryherogame.com\n\n" +
				" The concept is very simple. The hero is pretty much always hungry and you need to feed him with food." +
				" You score when your Hero eats food.\n\nThere are different obstacles that fly in with a \"Look out!\"" +
				" caution before they appear. Avoid them at all costs. You only have 5 lives. Try to score as much as possible and also" +
				" try to travel the longest distance.";
			var fontRegularBitmapFont:BitmapFont = TextField.getBitmapFont("fontRegular");
			aboutText = new TextField(480, 600, aboutValue, fontRegularBitmapFont.name, fontRegularBitmapFont.size, 0xffffff);
			aboutText.x = 60;
			aboutText.y = 230;
			aboutText.hAlign = HAlign.CENTER;
			aboutText.vAlign = VAlign.TOP;
			aboutText.height = aboutText.textBounds.height + 30;
			this.addChild(aboutText);
			
			hsharmaBtn = new Button(textureAtlas.getTexture("about_hsharmaLogo"));
			hsharmaBtn.x = aboutText.x;
			hsharmaBtn.y = aboutText.bounds.bottom;
			this.addChild(hsharmaBtn);
			
			starlingBtn = new Button(textureAtlas.getTexture("about_starlingLogo"));
			starlingBtn.x = aboutText.bounds.right - starlingBtn.width;
			starlingBtn.y = aboutText.bounds.bottom;
			this.addChild(starlingBtn);
			
			backBtn = new Button(textureAtlas.getTexture("about_backButton"));
			backBtn.x = 660;
			backBtn.y = 350;
			this.addChild(backBtn);
		}
	}
}