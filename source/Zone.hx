package ;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;

class Zone extends FlxSprite
{
	
	var mainColor:Int;
	public var index:Int;

	public function new(X:Int, Y:Int , color:Int, index:Int) 
	{
		super(X, Y);
		mainColor = color;
		this.index = index;
		makeGraphic(200, 200, color);
		//MouseEventManager.add(this, clicked);
	}
	
	public function changeColor():Void
	{
		makeGraphic(200, 200, FlxColor.WHITE);
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