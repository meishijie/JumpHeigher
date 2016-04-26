package ;

import flash.desktop.Clipboard;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.addons.display.FlxExtendedSprite;
import flixel.FlxState;
import flixel.input.mouse.FlxMouseEventManager;
import flixel.FlxObject;

class GamePlay extends FlxState
{

	private var _hero:Hero;
	private var _SEnemy:Enemy;
	private var _GEnemy:FlxTypedGroup<Enemy>;
	private var _StepTime:Int = 0;
	private var _MaxStepTime:Int = 100;
	private var _NextTime:Int = 1;
	private var _m:Int;
	private var ground:FlxSprite;
	
    override public function create():Void
    {
		_hero = new Hero();
		add(_hero);
		_hero.setPosition(FlxG.width * 0.5 - _hero.frameWidth * 0.5, FlxG.height * 0.4);
		_hero.maxVelocity.set(0, 800);
		_hero.acceleration.y = 2000;
		_hero.height = _hero.width = 50;

		
		ground = new FlxSprite();
		ground.makeGraphic(FlxG.width, Math.floor(FlxG.height * 0.5), FlxColor.WHITE);
		ground.setPosition(0, FlxG.height * 0.5);
		add(ground);
		ground.moves = false;
		ground.immovable = true;
		
		_GEnemy = new FlxTypedGroup<Enemy>();
		add(_GEnemy);
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
		FlxG.collide(ground, _hero);

		if (FlxG.mouse.justPressed && _hero.isTouching(FlxObject.FLOOR))
		{
			_hero.velocity.y = -2000 ;
		}
		
		
		_StepTime++;
		var m = Math.floor(Math.random());
		trace(m);
		if(_StepTime > _MaxStepTime){
			_StepTime = 0;
			makeEnemy();
		}
		_GEnemy.forEach(function(e){
			trace(e);
			var oo:Enemy = cast (e, Enemy);
			if (oo._canKill == true){
				_GEnemy.remove(oo);
				oo.exists = false;
			}
		});
    }
	
	private function makeEnemy(){
		_m = Math.round(Math.random()+1)-1;
		switch(_m){
			case 0:
				_SEnemy = new Enemy( -50, 200,FlxG.random.int(0, 5));
				_SEnemy.acceleration.x = 800;
				_SEnemy.maxVelocity.x = 500;
				_GEnemy.add(_SEnemy);
				
			case 1:
				_SEnemy = new Enemy( FlxG.width, 200,FlxG.random.int(0, 5));
				_SEnemy.acceleration.x = -800;
				_SEnemy.maxVelocity.x = 500;
				_GEnemy.add(_SEnemy);
		}

	}
	
}