package com.alex.myHungryHero.mvcs.mediators
{
	import com.alex.myHungryHero.screens.AboutScreen;
	import com.fireflyLib.core.SystemGlobal;
	import com.ponyMVC.Mediator;
	
	import starling.events.Event;
	import starling.utils.AssetManager;

	public class AboutScreenMdiator extends Mediator
	{
		private var mAboutScreen:AboutScreen;
		
		public function AboutScreenMdiator(uiTarget:Object)
		{
			super(uiTarget);
		}
		
		override public function onRegister():void
		{
			mAboutScreen = AboutScreen(uiTarget);
			
			mAboutScreen.hsharmaBtn.addEventListener(Event.TRIGGERED, onHsharmaBtnClick);
			mAboutScreen.starlingBtn.addEventListener(Event.TRIGGERED, onStarlingBtnClick);
			mAboutScreen.backBtn.addEventListener(Event.TRIGGERED, onAboutBackClick);
		}
		
		override public function onRemove():void
		{
			mAboutScreen.hsharmaBtn.removeEventListener(Event.TRIGGERED, onHsharmaBtnClick);
			mAboutScreen.starlingBtn.removeEventListener(Event.TRIGGERED, onStarlingBtnClick);
			mAboutScreen.backBtn.removeEventListener(Event.TRIGGERED, onAboutBackClick);
			
			mAboutScreen = null
		}
		
		//ui event handler
		private function onHsharmaBtnClick(event:Event):void
		{
		}
		
		private function onStarlingBtnClick(event:Event):void
		{
		}
		
		private function onAboutBackClick(event:Event):void
		{
			var assetManager:AssetManager = AssetManager(SystemGlobal.get("AssetManager"));
			assetManager.playSound("mushroom");
			
			facade.sendMediatorCommand("AppMediator", "showScreen", "WelecomScreen");
		}
	}
}