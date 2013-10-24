package
{
	import com.croco2dMGE.bootStrap.CrocoBootStrap;
	
	import bootStrapConfigs.XperiaLT18iBootStrapConfig;
	
	public class Croco2DEngineMobileScaffold extends CrocoBootStrap
	{
		public function Croco2DEngineMobileScaffold()
		{
			super();
		}
		
		override protected function onBootStrapConfigInit():void
		{
			new XperiaLT18iBootStrapConfig(this);
		}
	}
}