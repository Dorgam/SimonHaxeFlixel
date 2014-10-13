package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;

class Zone extends FlxSprite
{
	
	var mainColor:Int;

	public function new(X:Int, Y:Int , color:Int) 
	{
		super(X, Y);
		mainColor = color;
		makeGraphic(200, 200, color);
		//MouseEventManager.add(this, clicked);
	}
	
	public function changeColor():Void
	{
		makeGraphic(200, 200, FlxColor.BLACK);
	}
	
	public function firstColor():Void
	{
		makeGraphic(200, 200, mainColor);
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