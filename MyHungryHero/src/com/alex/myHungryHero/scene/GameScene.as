package com.alex.myHungryHero.scene
{
	import com.alex.myHungryHero.mvcs.AppFacade;
	import com.alex.myHungryHero.mvcs.models.GameModel;
	import com.alex.myHungryHero.scene.entities.FoodEntity;
	import com.alex.myHungryHero.scene.entities.HeroEntity;
	import com.croco2dMGE.world.CrocoScene;
	import com.croco2dMGE.world.SceneLayer;
	import com.fireflyLib.core.SystemGlobal;
	import com.fireflyLib.utils.MathUtil;
	
	import flash.geom.Rectangle;
	
	import starling.core.Starling;
	import starling.display.Stage;
	import starling.utils.deg2rad;
	import starling.utils.rad2deg;

	public class GameScene extends CrocoScene
	{
		public var gameFarBackgroundLayer:GameBackgroundLayer;
		public var heroLayer:HeroLayer;
		public var foodItemLayer:SceneLayer;
		public var heroEntity:HeroEntity;
		
		public var touchX:Number;
		public var touchY:Number;
		
		/** Hero's current X position. */
		public var heroX:int;
		
		/** Hero's current Y position. */
		public var heroY:int;
		
		public var playerSpeed:Number = 0.0;
		/** How long have we had a coffee item. */
		public var coffee:Number = 0;
		
		/** Collision detection for hero vs items. */
		public var heroItem_xDist:Number;
		public var heroItem_yDist:Number;
		public var heroItem_sqDist:Number;
		
		/** How long have we had a mushroom item. */
		public var mushroom:Number = 0;
		
		public var gameState:int;
		
		private var gameArea:Rectangle;
		
		private var cameraShake:Number;
		
		/** The power of obstacle after it is hit. */
		private var hitObstacle:Number = 0;
		
		/** Player's total height travelled. */
		private var scoreDistance:Number = 0;
		
		private var stage:Stage;
		
		private var gameModel:GameModel;
		
		/** Items pool with a maximum cap for reuse of items. */		
		
		public function GameScene()
		{
			super();
		}
		
		override protected function onInit():void
		{
			gameState = GameConstants.GAME_STATE_IDLE;
			stage = Starling.current.stage;
			
			gameFarBackgroundLayer = new GameBackgroundLayer();
			heroLayer = new HeroLayer();
			foodItemLayer = new SceneLayer();
			foodItemLayer.needRealTimeDepthSort = false;
			foodItemLayer.needDepthsort = false;
			gameArea = new Rectangle(100, 100, stage.stageWidth - 200, stage.stageHeight - 250);
			
			gameModel = GameModel(AppFacade(SystemGlobal.get("AppMVCFacade")).findModel("GameModel"));
			
			layers = [
				gameFarBackgroundLayer,
				foodItemLayer,
				heroLayer
			];
			
			super.onInit();
			
			heroEntity = heroLayer.heroEntity;
			
			heroEntity.x = -stage.stageWidth;
			heroEntity.y = stage.stageHeight/2;
		}
		
		override public function tick(deltaTime:Number):void
		{
			super.tick(deltaTime);
			
			if (isNaN(touchX))
			{
				touchX = stage.stageWidth * 0.5;
				touchY = stage.stageHeight * 0.5;
			}
			
			switch(gameState)
			{
				// Before game starts.
				case GameConstants.GAME_STATE_IDLE:
					// Take off.
					if (heroEntity.x < stage.stageWidth * 0.5 * 0.5)
					{
						heroEntity.x += ((stage.stageWidth * 0.5 * 0.5 + 10) - heroEntity.x) * 0.05;
						playerSpeed = 10//(GameConstants.HERO_MIN_SPEED - playerSpeed) * 0.001;
						gameFarBackgroundLayer.speed = playerSpeed * deltaTime;
					}
					break;
				
				// When game is in progress.
				case GameConstants.GAME_STATE_FLYING:
					// If not hit by obstacle, fly normally.
					
					heroEntity.y -= (heroEntity.y - touchY) * 0.1;
					
					// Rotate hero based on mouse position.
					if ((-(heroEntity.y - touchY) * 0.2) < 30 && (-(heroEntity.y - touchY) * 0.2) > -30) 
						heroEntity.displayObject.rotation = deg2rad(-(heroEntity.y - touchY) * 0.2);
					
					// Limit the hero's rotation to < 30.
					if (rad2deg(heroEntity.displayObject.rotation) > 30 ) heroEntity.displayObject.rotation = rad2deg(30);
					if (rad2deg(heroEntity.displayObject.rotation) < -30 ) heroEntity.displayObject.rotation = -rad2deg(30);
					
					// Confine the hero to stage area limit
					if (heroEntity.y > gameArea.bottom - heroEntity.visibleTestRect.height * 0.5)    
					{
						heroEntity.y = gameArea.bottom - heroEntity.visibleTestRect.height * 0.5;
						heroEntity.displayObject.rotation = deg2rad(0);
					}
					if (heroEntity.y < gameArea.top + heroEntity.visibleTestRect.height * 0.5)    
					{
						heroEntity.y = gameArea.top + heroEntity.visibleTestRect.height * 0.5;
						heroEntity.displayObject.rotation = deg2rad(0);
					}
					
					playerSpeed = 500;//(playerSpeed - GameConstants.HERO_MIN_SPEED) * 0.01;
					
					// Create food items.
					createFoodItemsPattern(deltaTime);
					
					// Store the hero's current x and y positions (needed for animations below).
					heroX = heroEntity.x;
					heroY = heroEntity.y;
					
					// Set the background's speed based on hero's speed.
					gameFarBackgroundLayer.speed = playerSpeed * deltaTime;
					
					// Calculate maximum distance travelled.
					scoreDistance += (playerSpeed * deltaTime) * 0.05;
					gameModel.setDistance(scoreDistance);
					break;
			}
		}
		
		private var mFoodTime:Number = 0.0;
		private var foodItem:FoodEntity;
		private function createFoodItemsPattern(delTime:Number):void
		{
			mFoodTime += delTime;
			
			if(mFoodTime > 0.2)
			{
				mFoodTime = 0;
				
//				if(foodItem) return;
				foodItem = new FoodEntity(Math.ceil(Math.random() * 5));
				foodItem.gameModel = gameModel;
				foodItem.heroEntity = heroEntity;
				foodItem.x = stage.stageWidth + 100;// + itemToTrack.width;
				foodItem.y = MathUtil.clamp(Math.random() *  gameArea.height, gameArea.top + 150, gameArea.bottom - 150);
				foodItemLayer.addItem(foodItem);
			}
		}
		
	}
}