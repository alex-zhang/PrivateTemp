package
{
	import com.croco2dMGE.bootStrap.CrocoBootStrap;
	
	import bootStrapConfigs.XperiaLT18iBootStrapConfig;
	
	public class Croco2DNapeScaffold extends CrocoBootStrap
	{
		public function Croco2DNapeScaffold()
		{
			super();
		}
		
		override protected function onBootStrapConfigInit():void
		{
			new XperiaLT18iBootStrapConfig(this);
		}
	}
}