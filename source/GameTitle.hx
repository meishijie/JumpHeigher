package;

import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.addons.display.FlxExtendedSprite;
import flixel.input.mouse.FlxMouseEventManager;

/**
 * @author TiagoLr (~~~~ ProG4mr ~~~~)
 * Improvements by @author Gama11
 */
class GameTitle extends FlxState
{
    private var _currentScoreText:FlxText;
    private var _bestScoreText:FlxText;
    private var _currentScore:Int;
    private var _bestScore:Int;

    override public function create():Void
    {
        var _title = new FlxText(FlxG.width/2,FlxG.height/2,0,"Battle",200);
        _title.systemFont = "Arial";
        _title.alignment = FlxTextAlign.CENTER;
        _title.autoSize = true;
        _title.setPosition(FlxG.width/2-_title.fieldWidth/2,20);
        add(_title);

        var _title1 = new FlxText(FlxG.width/2,FlxG.height/2 ,0,"SQUARE",150);
        _title1.systemFont = "Arial";
        _title1.alignment = FlxTextAlign.CENTER;
        _title1.autoSize = true;
        _title1.setPosition(FlxG.width/2-_title1.fieldWidth/2,_title.height);
        add(_title1);

        _currentScoreText = new FlxText(FlxG.width/2,300,0,Std.string(_currentScore),100);
        _currentScoreText.systemFont = "Arial";
        _currentScoreText.setPosition(FlxG.width/2-_currentScoreText.fieldWidth/2,500);
        add(_currentScoreText);
        _bestScoreText = new FlxText(FlxG.width/2,400,0,"BEST:"+Std.string(_bestScore),60);
        _bestScoreText.systemFont = "Arial";
        _bestScoreText.setPosition(FlxG.width/2-_bestScoreText.fieldWidth/2,600);
        add(_bestScoreText);

        var _svg:FlxSprite = new FlxSprite(FlxG.width/2,_bestScoreText.y+100);
        _svg.loadGraphic("assets/Btn_start.png");
        _svg.setPosition(FlxG.width/2 - _svg.width/2,_bestScoreText.y+100);
        add(_svg);
        FlxMouseEventManager.add(_svg,null, onMouseUp, null,null);

        FlxTween.tween(_title, { y: _title.y+100 }, 1,{ type: FlxTween.PINGPONG});
        FlxTween.tween(_title1, { y: _title1.y+100 }, 1,{ type: FlxTween.PINGPONG});

        FlxG.camera.bgColor = FlxColor.BLUE;
        FlxG.camera.antialiasing = true;


    }

    private function onMouseUp(sprite:FlxSprite){
        trace(sprite);
        FlxG.switchState(new GamePlay());

    }


    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);

    }




}