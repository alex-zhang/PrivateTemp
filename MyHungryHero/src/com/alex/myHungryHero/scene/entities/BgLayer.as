/**
 *
 * Hungry Hero Game
 * http://www.hungryherogame.com
 * 
 * Copyright (c) 2012 Hemanth Sharma (www.hsharma.com). All rights reserved.
 * 
 * This ActionScript source code is free.
 * You can redistribute and/or modify it in accordance with the
 * terms of the accompanying Simplified BSD License Agreement.
 *  
 */

package com.alex.myHungryHero.scene.entities
{
	import com.fireflyLib.core.SystemGlobal;
	
	import starling.core.Starling;
	import starling.display.BlendMode;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.display.Stage;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	/**
	 * This class defines each of background layers used in the InGame screen.
	 *  
	 * @author hsharma
	 * 
	 */
	public class BgLayer extends Sprite
	{
		/** Layer identification. */
		private var _layer:int;
		
		/** Primary image. */
		private var image1:Image;
		
		/** Secondary image. */
		private var image2:Image;
		
		/** Parallax depth - used to decide speed of the animation. */
		private var _parallaxDepth:Number;
		
		public function BgLayer(_layer:int)
		{
			super();
			
			this.touchable = false;
			
			this._layer = _layer;
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		/**
		 * On added to stage. 
		 * @param event
		 * 
		 */
		private function onAddedToStage(event:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			var assetManager:AssetManager = AssetManager(SystemGlobal.get("AssetManager"));
			
			if (_layer == 1)
			{
				image1 = new Image(assetManager.getTexture("bgLayer" + _layer));
				image1.blendMode = BlendMode.NONE;
				image2 = new Image(assetManager.getTexture("bgLayer" + _layer));
				image2.blendMode = BlendMode.NONE;
			}
			else
			{
				image1 = new Image(assetManager.getTexture("bgLayer" + _layer));
				image2 = new Image(assetManager.getTexture("bgLayer" + _layer));
			}
			
			image1.x = 0;
			image1.y = stage.stageHeight - image1.height;
			
			image2.x = image2.width;
			image2.y = image1.y;
			
			this.addChild(image1);
			this.addChild(image2);
		}

		/**
		 * Parallax depth. 
		 * 
		 */
		public function get parallaxDepth():Number { return _parallaxDepth; }
		public function set parallaxDepth(value:Number):void { _parallaxDepth = value; }
		
		override public function get stage():Stage { return Starling.current.stage}
	}
}