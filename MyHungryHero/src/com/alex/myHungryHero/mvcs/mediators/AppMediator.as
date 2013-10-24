package com.alex.myHungryHero.mvcs.mediators
{
	import com.croco2dMGE.bootStrap.CrocoBootStrap;
	import com.ponyMVC.Mediator;
	
	import feathers.controls.ScreenNavigator;
	import feathers.core.FeathersControl;
	
	import starling.core.Starling;
	import starling.events.Event;

	public class AppMediator extends Mediator
	{
		private var starlingRoot:ScreenNavigator;
		
		public function AppMediator(uiTarget:Object)
		{
			super(uiTarget);
		}
		
		override public function onRegister():void
		{
			starlingRoot = ScreenNavigator(Starling.current.root);
			starlingRoot.addEventListener(Event.CHANGE, screenNavigatorChangedhandler);
		}
		
		override public function onRemove():void
		{
			starlingRoot.removeEventListener(Event.CHANGE, screenNavigatorChangedhandler);
			starlingRoot = null;
		}
		
		override public function onCommand(commandId:String=null, data:Object=null, type:String=null):void
		{
			switch(commandId)
			{
				case "showScreen":
					starlingRoot.showScreen(String(data));
					break;
			}
		}
		
		//ui event handler
		private function screenNavigatorChangedhandler(event:Event):void
		{
			var screen:FeathersControl = FeathersControl(starlingRoot.activeScreen);
			var activeScreenID:String = starlingRoot.activeScreenID;
			switch(activeScreenID)
			{
				case "AboutScreen":
					if(facade.hasMediator("AboutScreenMdiator")) facade.removeMediator("AboutScreenMdiator");
					facade.registerMediator("AboutScreenMdiator", new AboutScreenMdiator(screen));
					break;
				
				case "WelecomScreen":
					if(facade.hasMediator("WelecomeScreenMediator")) facade.removeMediator("WelecomeScreenMediator");
					facade.registerMediator("WelecomeScreenMediator", new WelecomeScreenMediator(screen));
					break;
				
				case "GameScreen":
					if(facade.hasMediator("GameScreenMediator")) facade.removeMediator("GameScreenMediator");
					facade.registerMediator("GameScreenMediator", new GameScreenMediator(screen));
					break;
			}
		}
	}
}