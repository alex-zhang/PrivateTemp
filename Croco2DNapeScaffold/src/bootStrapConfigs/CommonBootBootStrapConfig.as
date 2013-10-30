package bootStrapConfigs
{
	import com.croco2dMGE.CrocoEngine;
	import com.croco2dMGE.bootStrap.CrocoBootStrap;
	import com.croco2dMGE.bootStrap.CrocoBootStrapConfig;
	
	import screens.MainScreen;
	
	import starling.utils.AssetManager;

	public class CommonBootBootStrapConfig extends CrocoBootStrapConfig
	{
		public function CommonBootBootStrapConfig(bootStrap:CrocoBootStrap)
		{
			super(bootStrap);
			
			CrocoEngine.debug = true;
			
			screens = [
				["MainScreen", [new MainScreen()]],
			];
			
			extentions = [
				["AssetManager", AssetManager],
			];
		}
	}
}