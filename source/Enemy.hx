package;

import flixel.util.FlxTimer;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author meishijie
 */
class Enemy extends FlxSprite
{
	private var _eType:Int = 1;
	public var _canKill:Bool = false;

	public function new(?X:Float=0, ?Y:Float=0, eType:Int = 1 ) 
	{
		super(X, Y);
		this._eType = eType;
		this.loadGraphic("assets/Enemy.png", true, 64, 64);
		animation.add("1", [0], 6, false);
		animation.add("2", [1], 6, false);
		animation.add("3", [2], 6, false);
		animation.add("4", [3], 6, false);
		animation.add("5", [4], 6, false);
		createEnemy(this._eType);
		this.angularAcceleration = 500;
		this.maxAngular = 500;

		new FlxTimer().start(2.0, myCallback, 1);
	}
	private function myCallback(Timer:FlxTimer):Void
	{
		_canKill = true;
	}
	function createEnemy(type:Int){
		animation.play(Std.string(type));

	}
	
	
}