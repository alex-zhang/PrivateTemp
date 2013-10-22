package com.alex.myHungryHero.ui
{
	import com.fireflyLib.core.SystemGlobal;
	
	import feathers.core.FeathersControl;
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.utils.AssetManager;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	public class GameScreenScoreInfoUI extends FeathersControl
	{
		/** Lives left. */
		private var _lives:int;
		
		/** Distance travelled. */
		private var _distance:int;
		
		/** Food items score. */
		private var _foodScore:int;
		
		/** Lives icon.  */		
		private var livesLabel:TextField;
		
		/** Lives TextField. */		
		private var livesText:TextField;
		
		/** Distance icon. */		
		private var distanceLabel:TextField;
		
		/** Distance TextField. */		
		private var distanceText:TextField;
		
		/** Food Score icon. */
		private var foodScoreLabel:TextField;
		
		/** Food Score TextField. */		
		private var foodScoreText:TextField;
		
		
		public function GameScreenScoreInfoUI()
		{
			super();
		}
		
		public function get lives():int { return _lives; }
		public function set lives(value:int):void
		{
			_lives = value;
			livesText.text = _lives.toString();
		}
		
		public function get distance():int { return _distance; }
		public function set distance(value:int):void
		{
			_distance = value;
			distanceText.text = _distance.toString();
		}
		
		public function get foodScore():int { return _foodScore; }
		public function set foodScore(value:int):void
		{
			_foodScore = value;
			foodScoreText.text = _foodScore.toString();
		}
		
		override protected function initialize():void
		{
			var assetManager:AssetManager = AssetManager(SystemGlobal.get("AssetManager"));
			var fontScoreValueBitmapFont:BitmapFont = TextField.getBitmapFont("fontScoreValue");
			var fontScoreLabelBitmapFont:BitmapFont = TextField.getBitmapFont("fontScoreLabel");
		
			// Lives label
			livesLabel = new TextField(150, 30, 
				"LIVES", 
				fontScoreLabelBitmapFont.name, 
				fontScoreLabelBitmapFont.size, 0xffffff);
			livesLabel.hAlign = HAlign.RIGHT;
			livesLabel.vAlign = VAlign.TOP;
			livesLabel.x = 150;
			livesLabel.y = 5;
			this.addChild(livesLabel);
			
			// Lives
			livesText = new TextField(150, 75, 
				"5", 
				fontScoreValueBitmapFont.name, 
				fontScoreValueBitmapFont.size, 0xffffff);
			livesText.hAlign = HAlign.RIGHT;
			livesText.vAlign = VAlign.TOP;
			livesText.width = livesLabel.width;
			
			livesText.x = int(livesLabel.x + livesLabel.width - livesText.width);
			livesText.y = livesLabel.y + livesLabel.height;
			this.addChild(livesText);
			
			// Distance label
			distanceLabel = new TextField(150, 30, 
				"DISTANCE", 
				fontScoreLabelBitmapFont.name, 
				fontScoreLabelBitmapFont.size, 0xffffff);
			distanceLabel.hAlign = HAlign.RIGHT;
			distanceLabel.vAlign = VAlign.TOP;
			
			distanceLabel.x = int(stage.stageWidth - distanceLabel.width - 10);
			distanceLabel.y = 5;
			this.addChild(distanceLabel);
			
			// Distance
			distanceText = new TextField(150, 75, 
				"0", 
				fontScoreValueBitmapFont.name, 
				fontScoreValueBitmapFont.size, 
				0xffffff);
			distanceText.hAlign = HAlign.RIGHT;
			distanceText.vAlign = VAlign.TOP;
			distanceText.width = distanceLabel.width;
			
			distanceText.x = int(distanceLabel.x + distanceLabel.width - distanceText.width);
			distanceText.y = distanceLabel.y + distanceLabel.height;
			this.addChild(distanceText);
			
			// Score label
			foodScoreLabel = new TextField(150, 30, 
				"SCORE", 
				fontScoreLabelBitmapFont.name, 
				fontScoreLabelBitmapFont.size,
				0xffffff);
			foodScoreLabel.hAlign = HAlign.RIGHT;
			foodScoreLabel.vAlign = VAlign.TOP;
			
			foodScoreLabel.x = int(distanceLabel.x - foodScoreLabel.width - 50);
			foodScoreLabel.y = 5;
			this.addChild(foodScoreLabel);
			
			// Score
			foodScoreText = new TextField(150, 75, 
				"0", 
				fontScoreLabelBitmapFont.name, 
				fontScoreLabelBitmapFont.size, 
				0xffffff);
			foodScoreText.hAlign = HAlign.RIGHT;
			foodScoreText.vAlign = VAlign.TOP;
			foodScoreText.width = foodScoreLabel.width;
			
			foodScoreText.x = int(foodScoreLabel.x + foodScoreLabel.width - foodScoreText.width);
			foodScoreText.y = foodScoreLabel.y + foodScoreLabel.height;
			this.addChild(foodScoreText);
		}
	}
}