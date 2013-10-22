package com.alex.myHungryHero.screens
{
	import com.alex.myHungryHero.scene.GameScene;
	import com.alex.myHungryHero.ui.GameScreenScoreInfoUI;
	import com.croco2dMGE.world.CrocoScreen;
	import com.fireflyLib.core.SystemGlobal;
	
	import feathers.controls.Button;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.textures.TextureAtlas;
	import starling.utils.AssetManager;
	
	public class GameScreen extends CrocoScreen
	{
		/** Pause button. */
		public var pauseButton:feathers.controls.Button;
		
		/** Kick Off button in the beginning of the game .*/
		public var startButton:starling.display.Button;
		
		public var gameScreenScoreInfoUI:GameScreenScoreInfoUI;
		
		public function GameScreen()
		{
			super();
			
			sceneCls = GameScene;
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			var assetManager:AssetManager = SystemGlobal.get("AssetManager");
			var textureAtlas:TextureAtlas = assetManager.getTextureAtlas("mySpritesheet");
			
			//puse
			pauseButton = new feathers.controls.Button();
			pauseButton.isToggle = true;
			pauseButton.x = pauseButton.width * 2;
			pauseButton.y = pauseButton.height * 0.5;
			addChild(pauseButton);
			pauseButton.stateToSkinFunction = null;
			pauseButton.defaultSkin = new Image(textureAtlas.getTexture("soundOn0000"));
			pauseButton.defaultSelectedSkin = new Image(textureAtlas.getTexture("soundOff"));

			//ui
			gameScreenScoreInfoUI = new GameScreenScoreInfoUI();
			addChild(gameScreenScoreInfoUI);
			
			//start
			startButton = new starling.display.Button(textureAtlas.getTexture("startButton"));
			startButton.fontColor = 0xffffff;
			startButton.x = stage.stageWidth/2 - startButton.width/2;
			startButton.y = stage.stageHeight/2 - startButton.height/2;
			this.addChild(startButton);
		}
	}
}