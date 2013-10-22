package com.alex.myHungryHero.mvcs.models
{
	import com.ponyMVC.Model;

	public class GameModel extends Model
	{
		//Events
		public static const GAME_OVER:String = "GAME_OVER";
		public static const GAME_RESET:String = "GAME_RESET";
		
		public static const GAME_LIFE_CHANGE:String = "GAME_LIFE_CHANGE";
		public static const GAME_DISTANCE_CHANGE:String = "GAME_DISTANCE_CHANGE";
		public static const GAME_SCORE_CHANGE:String = "GAME_SCORE_CHANGE";
		
		public static const DEFAULT_LIFE:int = 5;
		
		private var mLife:int = DEFAULT_LIFE;
		private var mScore:int = 0;
		private var mDistance:Number = 0.0;
		
		private var mMoveSpeed:Number = 0.0;
		
		public function GameModel()
		{
			super();
		}
		
		public function getLife():int
		{
			return mLife;
		}
		
		public function decreaseLife():void
		{
			mLife--;

			if(mLife == 0)
			{
				dispatchEvent(GAME_LIFE_CHANGE);
				dispatchEvent(GAME_OVER);
			}
			else
			{
				dispatchEvent(GAME_LIFE_CHANGE);
			}
		}
		
		public function getScroe():int
		{
			return mScore;
		}
		
		public function getDistance():int
		{
			return mDistance;
		}
		
		public function setDistance(value:Number):void
		{
			mDistance = value;
			dispatchEvent(GAME_DISTANCE_CHANGE);
		}
		
		public function addScore(value:uint):void
		{
			mScore += value;
			dispatchEvent(GAME_SCORE_CHANGE);
		}
		
		public function reset():void
		{
			mLife = DEFAULT_LIFE;
			mDistance = 0;
			mScore = 0;
			mMoveSpeed = 0;
			
			dispatchEvent(GAME_RESET);
		}
	}
}