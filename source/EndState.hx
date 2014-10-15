package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class EndState extends FlxState
{
	
	var text:FlxText;
	var restartBtn:FlxButton;
	
    override public function create():Void
    {
		text = new FlxText(110, 160, 1000);
		text.text = "Game Over, you scored : " + PlayState.score;
		text.setFormat(25, FlxColor.RED);
		add(text);
		restartBtn = new FlxButton(0, 0, "Restart Game" , onClick);
		restartBtn.screenCenter();
		add(restartBtn);
        super.create();
    }
	
	private function onClick()
	{
		FlxG.switchState(new PlayState());
	}

    override public function update():Void
    {
        super.update();
    }

    override public function destroy():Void
    {
        super.destroy();
    }
}