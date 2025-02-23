package;

import flixel.FlxState;
import flixel.FlxG;

class GameState extends FlxState
{
    override public function create()
    {
        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        if (FlxG.keys.justPressed.ESCAPE)
        {
            FlxG.switchState(new PauseState());
        }
    }
}
