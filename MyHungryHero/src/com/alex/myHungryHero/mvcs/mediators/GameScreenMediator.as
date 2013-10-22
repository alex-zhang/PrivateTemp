package com.alex.myHungryHero.mvcs.mediators
{
	import com.alex.myHungryHero.mvcs.models.GameModel;
	import com.alex.myHungryHero.scene.GameConstants;
	import com.alex.myHungryHero.scene.GameScene;
	import com.alex.myHungryHero.screens.GameScreen;
	import com.ponyMVC.Mediator;
	
	import starling.core.Starling;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;

	public class GameScreenMediator extends Mediator
	{
		private var mGameScreen:GameScreen;
		private var gameScene:GameScene;
		private var mGameModel:GameModel;
		private var stage:Stage;
		
		public function GameScreenMediator(uiTarget:Object)
		{
			super(uiTarget);
		}
		
		override public function onRegister():void
		{
			mGameScreen = GameScreen(uiTarget);
			gameScene = GameScene(mGameScreen.scene);
			mGameModel = GameModel(facade.findModel("GameModel"));
			stage = Starling.current.stage;
			
			//ui event
			mGameScreen.pauseButton.addEventListener(Event.TRIGGERED, onPauseButtonClick);
			mGameScreen.startButton.addEventListener(Event.TRIGGERED, onStartButtonClick);
			
			stage.addEventListener(TouchEvent.TOUCH, onGameScreenTouch);
			
			//model event
			mGameModel.addEventListener(GameModel.GAME_DISTANCE_CHANGE, gameModelDistanceChangeHandler);
			mGameModel.addEventListener(GameModel.GAME_LIFE_CHANGE, gameModelLifeChangeHandler);
			mGameModel.addEventListener(GameModel.GAME_OVER, gameModelGameOverHandler);
			mGameModel.addEventListener(GameModel.GAME_RESET, gameModelGameResetHandler);
			mGameModel.addEventListener(GameModel.GAME_SCORE_CHANGE, gameModelScoreChangeHandler);
		}
		
		override public function onRemove():void
		{
			mGameScreen.pauseButton.removeEventListener(Event.TRIGGERED, onPauseButtonClick);
			
			stage = null;
			mGameScreen = null;
		}
		
		////ui event handler
		private function onGameScreenTouch(event:TouchEvent):void
		{
			var touch:Touch = event.getTouch(stage);
			if(!touch) return;
			
			gameScene.touchX = touch.globalX;
			gameScene.touchY = touch.globalY;
		}
		
		private function onPauseButtonClick(event:Event):void
		{
		}
		
		private function onStartButtonClick(event:Event):void
		{
			gameScene.gameState = GameConstants.GAME_STATE_FLYING;
			
			mGameScreen.startButton.visible = false;
		}
		
		//model handler
		private function gameModelDistanceChangeHandler(model:GameModel):void
		{
			mGameScreen.gameScreenScoreInfoUI.distance = model.getDistance();
		}
		
		private function gameModelScoreChangeHandler(model:GameModel):void
		{
			mGameScreen.gameScreenScoreInfoUI.foodScore = model.getScroe();
		}
		
		private function gameModelLifeChangeHandler(model:GameModel):void
		{
			mGameScreen.gameScreenScoreInfoUI.foodScore = model.getScroe();
		}
		
		private function gameModelGameOverHandler(model:GameModel):void
		{
		}
		
		private function gameModelGameResetHandler(model:GameModel):void
		{
		}
	}
}