package com.alex.myHungryHero.mvcs
{
	import com.alex.myHungryHero.mvcs.mediators.AppMediator;
	import com.alex.myHungryHero.mvcs.models.GameModel;
	import com.ponyMVC.Facade;

	public class AppFacade extends Facade
	{
		public function AppFacade(context:Object)
		{
			super(context);
		}
		
		override protected function initializeController( ):void 
		{
		}
		
		override protected function initializeView():void
		{
			registerMediator("AppMediator", new AppMediator(context.starlingRoot));
			registerModel("GameModel", new GameModel());
		}
	}
}