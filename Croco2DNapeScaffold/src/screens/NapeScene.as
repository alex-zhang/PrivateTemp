package screens
{
	import com.croco2dMGE.CrocoEngine;
	import com.croco2dMGE.world.CrocoScene;
	
	import flash.ui.Keyboard;
	
	import nape.geom.Vec2;
	import nape.phys.Body;
	import nape.phys.BodyType;
	import nape.shape.Polygon;
	import nape.space.Space;
	import nape.util.BitmapDebug;
	import nape.util.Debug;
	
	import starling.core.RenderSupport;
	import starling.events.KeyboardEvent;

	public class NapeScene extends CrocoScene
	{
		public static const GRAVITY:int = 600;
		
		public static const SCENE_WIDTH:int = 960 * 2;
		public static const SCENE_HEIGHT:int = 640;
		
		public var napeSpace:Space;
		public var napeSpaceDebug:Debug;
		public var role:Body;

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
			floor.shapes.add(new Polygon(Polygon.rect(0, SCENE_HEIGHT - 20, SCENE_WIDTH, 10)));
			floor.space = napeSpace;
			
			if(CrocoEngine.debug)
			{
				napeSpaceDebug = new BitmapDebug(CrocoEngine.width, CrocoEngine.height);
				CrocoEngine.crocoStarling.nativeOverlay.addChild(napeSpaceDebug.display);
			}
			
			role = new Body(BodyType.DYNAMIC);
			role.allowRotation = false;
			role.shapes.add(new Polygon(Polygon.box(16, 32)));
			role.position.setxy(100, 100);
			role.space = napeSpace;
			
			CrocoEngine.starlingStage.addEventListener(KeyboardEvent.KEY_DOWN, stageKeyDownHandler);
		}
		
		private function stageKeyDownHandler(event:KeyboardEvent):void
		{
			if(!role) return;
			
			switch(event.keyCode)
			{
				case Keyboard.A:
					role.velocity.x = -100;
					break;
				
				case Keyboard.D:
					role.velocity.x = 100;
					break;
				
				case Keyboard.J://jump
					role.velocity.y -= 500;
					break;
			}
		}
		
		override public function tick(deltaTime:Number):void
		{
			napeSpace.step(deltaTime);
			
			super.tick(deltaTime);
			
			trace(role.velocity.x, role.velocity.y);
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