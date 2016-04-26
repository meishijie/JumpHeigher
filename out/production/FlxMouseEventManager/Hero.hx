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

		this.loadGraphic("assets/Enemy.png", true, 64, 64);
		animation.add("1", [5], 0, false);
		animation.play("1");
		
	}
	
    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
		
		 
    }
	 override public function destroy():Void
    {
        super.destroy();
    }
	
}