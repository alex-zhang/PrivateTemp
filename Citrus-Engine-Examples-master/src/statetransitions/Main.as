package statetransitions {

	import citrus.core.starling.StarlingCitrusEngine;
	import flash.events.Event;
	
	import statetransitions.StarlingDemoStateTransition;

	[SWF(frameRate="60")]

	/**
	* @author Aymeric
	*/
	public class Main extends StarlingCitrusEngine {

		public function Main() {
		}
		
		override protected function handleAddedToStage(e:Event):void
		{
			super.handleAddedToStage(e);
			
			setUpStarling(true);
			
			sound.addSound("Hurt", {sound:"sounds/hurt.mp3"});
			sound.addSound("Kill", {sound:"sounds/kill.mp3"});
		}
		
		override public function handleStarlingReady():void
		{
			state = new StarlingDemoStateTransition();
		}
	}
}