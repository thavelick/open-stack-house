package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.addons.display.shapes.FlxShapeBox;

class GameState extends FlxState
{
    private var player:Player;
    private var border:FlxShapeBox;

    override public function create()
    {
        super.create();

        // Create border
        border = new FlxShapeBox(0, 0, FlxG.width, FlxG.height, {thickness: 2, color: FlxColor.BLUE}, FlxColor.TRANSPARENT);
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
