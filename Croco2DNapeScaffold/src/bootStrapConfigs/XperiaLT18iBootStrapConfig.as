package bootStrapConfigs
{
	import com.croco2dMGE.CrocoEngine;
	import com.croco2dMGE.bootStrap.CrocoBootStrap;

	public class XperiaLT18iBootStrapConfig extends CommonBootBootStrapConfig
	{
		public function XperiaLT18iBootStrapConfig(bootStrap:CrocoBootStrap)
		{
			super(bootStrap);
			
			CrocoEngine.debug = true;
			launchImagePath = "assets/launImage854_480.jpg";
		}
	}
}