package com.alex.myHungryHero.mvcs.mediators
{
	import com.alex.myHungryHero.screens.WelecomScreen;
	import com.fireflyLib.core.SystemGlobal;
	import com.ponyMVC.Mediator;
	
	import starling.events.Event;
	import starling.utils.AssetManager;

	public class WelecomeScreenMediator extends Mediator
	{
		private var welecomScreen:WelecomScreen;
		
		public function WelecomeScreenMediator(uiTarget:Object)
		{
			super(uiTarget)
		}
		
		override public function onRegister():void
		{
			welecomScreen = WelecomScreen(uiTarget);
			welecomScreen.aboutBtn.addEventListener(Event.TRIGGERED, onAboutClick);
			welecomScreen.playBtn.addEventListener(Event.TRIGGERED, onPlayClick);
		}
		
		override public function onRemove():void
		{
			welecomScreen.aboutBtn.removeEventListener(Event.TRIGGERED, onAboutClick);
			welecomScreen.playBtn.removeEventListener(Event.TRIGGERED, onPlayClick);
			welecomScreen = null;
		}
		
		//ui event handler
		private function onAboutClick(event:Event):void
		{
			var assetManager:AssetManager = AssetManager(SystemGlobal.get("AssetManager"));
			assetManager.playSound("mushroom");
			
			facade.sendMediatorCommand("AppMediator", "showScreen", "AboutScreen");
		}
		
		private function onPlayClick(event:Event):void
		{
			var assetManager:AssetManager = AssetManager(SystemGlobal.get("AssetManager"));
			assetManager.playSound("coffee");
			
			facade.sendMediatorCommand("AppMediator", "showScreen", "GameScreen");
		}
	}
}