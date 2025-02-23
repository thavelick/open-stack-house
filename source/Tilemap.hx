package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.group.FlxGroup;

class Tilemap extends FlxGroup
{
    private static inline var TILE_SIZE:Int = 32;
    private static inline var GROUND_LEVEL:Int = 7; // 7th row from bottom
    private static inline var PLAYER_START_X:Int = 3; // Player starts at 4th column (0-based index)
    private static inline var PLAYER_START_Y:Int = 6; // Player starts at 7th row from top

    public function new()
    {
        super();
        createTiles();
    }

    private function createTiles():Void
    {
        // Create a grid of tiles at the bottom
        for (y in GROUND_LEVEL - 2...GROUND_LEVEL + 1) // Create 3 rows
        {
            for (x in 0...8) // 8 columns
            {
                // Skip player start position
                if (x == PLAYER_START_X && y == PLAYER_START_Y)
                    continue;

                // Random chance to create a block
                if (FlxG.random.bool(70)) // 70% chance to create a block
                {
                    var tile = new FlxSprite(x * TILE_SIZE, y * TILE_SIZE);
                    tile.makeGraphic(TILE_SIZE, TILE_SIZE, FlxG.random.color());
                    add(tile);
                }
            }
        }
    }
}
