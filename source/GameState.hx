package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;

class GameState extends FlxState
{
    private var player:Player;
    private var border:FlxSprite;

    override public function create()
    {
        super.create();

        // Create border
	# ai! FlxSprite doesn't have a drawrect. I think you want https://api.haxeflixel.com/flixel/addons/display/shapes/FlxShapeBox.html
        border = new FlxSprite(0, 0);
        border.makeGraphic(FlxG.width, FlxG.height, FlxColor.TRANSPARENT);

        border.drawRect(0, 0, FlxG.width, FlxG.height, FlxColor.TRANSPARENT, {color: FlxColor.BLUE, thickness: 2});
        add(border);

        // Create player at bottom center of screen
        player = new Player((FlxG.width - 32) / 2, FlxG.height - 48);
        add(player);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.P)
        {
            FlxG.switchState(new PauseState());
        }
    }
}
