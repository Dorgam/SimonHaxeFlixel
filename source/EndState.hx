package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.util.FlxColor;

using flixel.util.FlxSpriteUtil;

class EndState extends FlxState
{
	
	var text:FlxText;
	
    override public function create():Void
    {
		text = new FlxText(230, 160, 1000);
		text.text = "Game Over";
		text.setFormat(25, FlxColor.RED);
		add(text);
        super.create();
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