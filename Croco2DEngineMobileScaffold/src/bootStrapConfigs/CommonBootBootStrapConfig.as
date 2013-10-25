package bootStrapConfigs
{
	import com.croco2dMGE.bootStrap.CrocoBootStrap;
	import com.croco2dMGE.bootStrap.CrocoBootStrapConfig;
	
	import screens.AboutScreen;
	
	import starling.utils.AssetManager;

	public class CommonBootBootStrapConfig extends CrocoBootStrapConfig
	{
		public function CommonBootBootStrapConfig(bootStrap:CrocoBootStrap)
		{
			super(bootStrap);
			
			screens = [
				["AboutScreen", [new AboutScreen()]],
			];
			
			extentions = [
				["AssetManager", AssetManager],
			];
		}
	}
}