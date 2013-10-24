package screens
{
	import com.fireflyLib.core.SystemGlobal;
	
	import feathers.controls.Screen;
	
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.utils.AssetManager;

	public class AboutScreen extends Screen
	{
		/** Background image. */
		public var bg:Image;
		
		public function AboutScreen()
		{
			super();
		}
		
		override protected function initialize():void
		{
			var assetManager:AssetManager = AssetManager(SystemGlobal.get("AssetManager"));
			
			bg = new Image(assetManager.getTexture("background"));
			bg.blendMode = BlendMode.NONE;
			this.addChild(bg);
		}
	}
}