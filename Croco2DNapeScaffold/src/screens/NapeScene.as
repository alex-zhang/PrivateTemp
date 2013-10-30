package screens
{
	import com.croco2dMGE.CrocoEngine;
	import com.croco2dMGE.world.CrocoScene;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import nape.util.Debug;
	
	import starling.core.RenderSupport;

	public class NapeScene extends CrocoScene
	{
		public static const GRAVITY:int = 600;
		
		public static const SCENE_WIDTH:int = 960 * 2;
		public static const SCENE_HEIGHT:int = 640;
		
		public var napeSpace:Space;
		public var napeSpaceDebug:Debug;

		public function NapeScene()
		{
			super();
		}
		
		override protected function onInit():void
		{
			super.onInit();
			
			//gravity
			napeSpace = new Space(Vec2.weak(0, GRAVITY));
			
			var floor:Body = new Body(BodyType.STATIC);
			floor.shapes.add(new Polygon(Polygon.rect(0, SCENE_HEIGHT - 2, SCENE_WIDTH, 1)));
			floor.space = napeSpace;
			
			if(CrocoEngine.debug)
			{
				napeSpaceDebug = new BitmapDebug(CrocoEngine.width, CrocoEngine.height);
				CrocoEngine.crocoStarling.nativeOverlay.addChild(napeSpaceDebug.display);
			}
			
			for (var i:int = 0; i < 16; i++) 
			{
				var box:Body = new Body(BodyType.DYNAMIC);
				box.shapes.add(new Polygon(Polygon.box(16, 32)));
				box.position.setxy(20, ((SCENE_HEIGHT - 50) - 32 * (i + 0.5)));
				box.space = napeSpace;
			}
		}
		
		override public function tick(deltaTime:Number):void
		{
			napeSpace.step(deltaTime);
			
			super.tick(deltaTime);
		}
		
		override public function draw(support:RenderSupport, parentAlpha:Number):void
		{
			super.draw(support, parentAlpha);
			
			if(CrocoEngine.debug)
			{
				napeSpaceDebug.clear();
				napeSpaceDebug.draw(napeSpace);
				napeSpaceDebug.flush();
			}
		}
	}
}