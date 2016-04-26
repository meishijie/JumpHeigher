package ;

import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
using flixel.util.FlxSpriteUtil;

/**
 * ...
 * @author meishijie
 */
class Hero extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0 )
	{
		super(X, Y);

		var canvas = new FlxSprite();
		canvas.makeGraphic(50, 50, FlxColor.TRANSPARENT, true);
		FlxG.state.add(canvas);
		this.makeGraphic(50,50,FlxColor.TRANSPARENT);
		canvas.drawCircle(0,0, 25, FlxColor.WHITE);

	}

	
	
}