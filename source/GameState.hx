package;

import flixel.FlxState;
import flixel.FlxG;

class GameState extends FlxState
{
    private var player:Player;

    override public function create()
    {
        super.create();
        
        // Create player at bottom center of screen
        player = new Player((FlxG.width - 32) / 2, FlxG.height - 64);
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
