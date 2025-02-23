package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.ui.FlxButton;
import flixel.text.FlxText;

class MenuState extends FlxState
{
    private var startButton:FlxButton;

    override public function create()
    {
        super.create();

        var titleText = new FlxText(0, 20, 0, "Open Stack House", 40);
        titleText.screenCenter(X);
        add(titleText);

        startButton = new FlxButton(0, 0, "Start Game", startGame);
        startButton.screenCenter();
        add(startButton);
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);
    }

    private function startGame():Void
    {
        FlxG.switchState(new GameState());
    }
}
