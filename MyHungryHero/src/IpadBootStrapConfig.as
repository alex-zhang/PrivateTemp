package
{
	import com.alex.myHungryHero.mvcs.AppFacade;
	import com.alex.myHungryHero.screens.AboutScreen;
	import com.alex.myHungryHero.screens.GameScreen;
	import com.alex.myHungryHero.screens.WelecomScreen;
	import com.croco2dMGE.CrocoBootStrapConfig;
	import com.fireflyLib.debug.Logger;
	
	import flash.geom.Rectangle;
	
	import starling.utils.AssetManager;

	public class IpadBootStrapConfig extends CrocoBootStrapConfig
	{
		public function IpadBootStrapConfig(context:Object)
		{
			super(context);
			
			Logger.startup();
			
			CrocoBootStrapConfig.screenViewPort = new Rectangle(0, 0, 1024, 768);
			CrocoBootStrapConfig.backgroundColor = 0x000000;
			CrocoBootStrapConfig.frameRate = 60;
//			CrocoBootStrapConfig.themeClass = MetalWorksMobileTheme;
//			CrocoBootStrapConfig.launchImage = "assets/ipad_launchImage.jpg";
			
			CrocoBootStrapConfig.screens = [
				["WelecomScreen", [new WelecomScreen()]],
				["AboutScreen", [new AboutScreen()]],
				["GameScreen", [new GameScreen()]],
			];
			
			CrocoBootStrapConfig.extentions = [
				["AssetManager", AssetManager, [CrocoBootStrapConfig.assetsScaleFactor, CrocoBootStrapConfig.assetsUseMipMaps]],
				["AppMVCFacade", AppFacade, [context]]
			];
		}
	}
}