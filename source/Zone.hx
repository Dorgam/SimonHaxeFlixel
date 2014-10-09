package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Zone extends FlxSprite
{

	public function new(X:Int, Y:Int , color:Int) 
	{
		super(X, Y);
		makeGraphic(200,200, color);
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