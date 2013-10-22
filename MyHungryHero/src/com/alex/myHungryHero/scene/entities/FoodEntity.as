package com.alex.myHungryHero.scene.entities
{
	import com.alex.myHungryHero.mvcs.models.GameModel;
	import com.croco2dMGE.core.CrocoGroup;
	import com.croco2dMGE.utils.CrocoRect;
	import com.croco2dMGE.world.SceneEntity;
	import com.fireflyLib.core.SystemGlobal;
	
	import starling.display.Image;
	import starling.textures.Texture;
	import starling.utils.AssetManager;

	public class FoodEntity extends SceneEntity
	{
		public var heroEntity:HeroEntity;
		public var gameModel:GameModel;
		
		private var mType:int;
		
		private var itemImage:Image;
		
		public function FoodEntity(type:int)
		{
			super();
			
			mType = type;
		}
		
		public function set foodItemType(type:int):void
		{
			if(mType != type)
			{
				mType = type;
			
				if(itemImage)
				{
					var texture:Texture = AssetManager(SystemGlobal.get("AssetManager")).getTexture("item" + mType); 
					itemImage.texture = texture;
				}
			}
		}
		
		override protected function onInit():void
		{
			var texture:Texture = AssetManager(SystemGlobal.get("AssetManager")).getTexture("item" + mType); 
			
			itemImage = new Image(texture);
			itemImage.pivotX = texture.width * 0.5;
			itemImage.pivotY = texture.height * 0.5;
			displayObject = itemImage;
			
			visibleTestRect = new CrocoRect(-texture.width * 0.5, -texture.height * 0.5, 
				texture.width, texture.height * 0.5)
		}
		
		public function get foodItemType():int
		{
			return mType;
		}
		
		override public function tick(deltaTime:Number):void
		{
			super.tick(deltaTime);
			
			this.x -= 500 * deltaTime; 
			
			// If the item passes outside the screen on the left, remove it (check-in).
			if(this.x < -80)
			{
				CrocoGroup(owner).removeItem(this);
			}
			else
			{
				// Collision detection - Check if the hero eats a food item.
				var collision:Boolean = this.isOverlapSceneObject(heroEntity);
				if(collision)
				{
					gameModel.addScore(20);
					CrocoGroup(owner).removeItem(this);
				}
			}
		}
		
	}
}