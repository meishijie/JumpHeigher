package ;

import flash.desktop.Clipboard;
import flixel.FlxSprite;
import flixel.effects.particles.FlxEmitter;
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
	private var _tween:FlxTween;
	private var _tweenOp:TweenOptions;
	private var _tweenOp1:TweenOptions;
	private var _canJump:Bool = true;

    override public function create():Void
    {
		_hero = new Hero();
		add(_hero);
		_hero.setPosition(FlxG.width * 0.5 - _hero.frameWidth * 0.5, FlxG.height * 0.4);
		//_hero.maxVelocity.set(0, 1600);
		//_hero.acceleration.y = 1600;
		_hero.height = _hero.width = 50;
		_hero.y = 450;

		
		ground = new FlxSprite();
		ground.makeGraphic(FlxG.width, Math.floor(FlxG.height * 0.5), FlxColor.WHITE);
		ground.setPosition(0, FlxG.height * 0.5);
		add(ground);
		ground.moves = false;
		ground.immovable = true;
		
		_GEnemy = new FlxTypedGroup<Enemy>();
		add(_GEnemy);

		_tweenOp = { type: FlxTween.PERSIST };
		_tweenOp1 = { type: FlxTween.BACKWARD };
		
		var _emitter:FlxEmitter = new FlxEmitter(FlxG.width / 2 , FlxG.height / 2, 200);
		_emitter.makeParticles(2, 2, FlxColor.WHITE, 200);
		add(_emitter);
		_emitter.start(false, 0.01);
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
		FlxG.overlap(_GEnemy, _hero,overle);

		if (FlxG.mouse.justPressed && _canJump == true )//&& _hero.isTouching(FlxObject.FLOOR)
		{
			//_hero.velocity.y = -1600 ;
			_canJump = false;
			trace(_hero.isTouching(FlxObject.FLOOR));
			_tween = FlxTween.tween(_hero, {  y: 150 }, 0.3, { type: FlxTween.PERSIST, onComplete: backTween});
		}


		_StepTime++;
		var m = Math.floor(Math.random());
		//trace(m);
		if(_StepTime > _MaxStepTime){
			_StepTime = 0;
			makeEnemy();
		}
		_GEnemy.forEach(function(e){
			//trace(e);
			var oo:Enemy = cast (e, Enemy);
			if (oo._canKill == true){
				_GEnemy.remove(oo);
				oo.exists = false;
			}
		});
    }

	private function overle(Object1:FlxObject, Object2:FlxObject){
		trace("over");
		Object1.kill();
	}
	private function backTween(tween:FlxTween):Void
	{
		_tween = FlxTween.tween(_hero, {  y: 450}, 0.3, { type: FlxTween.PERSIST, onComplete: TurnCanJump});
	}
	private function TurnCanJump(tween:FlxTween):Void
	{
		_canJump = true;
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