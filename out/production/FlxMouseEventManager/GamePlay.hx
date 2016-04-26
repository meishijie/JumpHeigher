package ;

import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.addons.display.FlxExtendedSprite;
import flixel.FlxState;


class GamePlay extends FlxState
{


	private var _SEnemy:Enemy;
	private var _GEnemy:FlxTypedGroup<Enemy>;
	private var _StepTime:Int = 0;
	private var _MaxStepTime:Int = 100;
	private var _NextTime:Int = 1;
	private var _m:Int;
	
    override public function create():Void
    {
		//_SEnemy = new Enemy(0, 0, 1);
		//add(_SEnemy);
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
		_StepTime++;
		var m = Math.floor(Math.random());
		trace(m);
		if(_StepTime > _MaxStepTime){
			_StepTime = 0;
			//FlxG.camera.shake();
			makeEnemy();
		}
		_GEnemy.forEach(function(e){
			trace(e);
			var oo:Enemy = cast (e, Enemy);
			if (oo._canKill == true){
//				FlxG.camera.shake();
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