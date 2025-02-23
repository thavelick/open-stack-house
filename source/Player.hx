package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class Player extends FlxSprite
{
    private static inline var SPEED:Float = 100;
    private static inline var RISING_GRAVITY:Float = 500;
    private static inline var FALLING_GRAVITY:Float = 1200;
    private static inline var JUMP_FORCE:Float = -195;
    private var canJump:Bool = true;
    private var isRising:Bool = false;

    public function new(x:Float, y:Float)
    {
        super(x, y);
        makeGraphic(28, 28, FlxColor.PINK);
        acceleration.y = RISING_GRAVITY; // Add initial gravity
        immovable = false; // Player is movable
    }


    public function moveLeft():Void
    {
        velocity.x = -SPEED;
    }

    public function moveRight():Void
    {
        velocity.x = SPEED;
    }

    public function jump():Void
    {
        if (canJump)
        {
            velocity.y = JUMP_FORCE;
            canJump = false;
        }
    }

    private function checkCollisions():Void
    {
        var tilemap = FlxG.state.members[2]; // Tilemap is at index 2

        // Check collision with tilemap
        if (FlxG.collide(this, tilemap))
        {
            // Only set velocity.y to zero if we're landing on top of a block
            if (velocity.y == 0) // We're standing on something
            {
                velocity.y = 0;
                canJump = true;
            }
        }

        // Check collision with ground (32 pixels from bottom)
        if (y + height >= FlxG.height - 32)
        {
            y = FlxG.height - 32 - height;
            velocity.y = 0;
            canJump = true;
        }

        // Screen bounds
        if (x < 0)
        {
            x = 0;
        }
        else if (x > FlxG.width - width)
        {
            x = FlxG.width - width;
        }
    }

    override public function update(elapsed:Float):Void
    {
        // Handle input and modify velocities first
        velocity.x = 0;

        // Movement
        if (FlxG.keys.pressed.RIGHT)
        {
            moveRight();
        }
        if (FlxG.keys.pressed.LEFT)
        {
            moveLeft();
        }

        // Check for horizontal collisions
        if (velocity.x != 0)
        {
            FlxG.collide(this, FlxG.state.members[2]); // Tilemap is at index 2
        }

        // Jumping
        if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.X)
        {
            jump();
        }

        // Apply different gravity based on movement direction
        if (velocity.y < 0)
        {
            isRising = true;
            acceleration.y = RISING_GRAVITY;
        }
        else if (velocity.y > 0)
        {
            isRising = false;
            acceleration.y = FALLING_GRAVITY;
        }

        // Call super.update() to apply velocities
        super.update(elapsed);

        // Handle all collisions
        checkCollisions();
    }
}
