package
{
	import com.croco2dMGE.bootStrap.CrocoBootStrap;
	
	public class MyHungryHero extends CrocoBootStrap
	{
		public function MyHungryHero()
		{
			super();
		}
		
		override protected function onInitConfig():void
		{
			new IpadBootStrapConfig(this);
		}
		
		override protected function onScreenNavigatorInit():void
		{
			super.onScreenNavigatorInit();	
			
//			new SimpleTransitionManager(mScreenNavigator);
		}
		
		override protected function onCrocoEngineInit():void
		{
//			CrocoEngine.graphicsDebug = true;
			super.onCrocoEngineInit();
		}
	}
}