## Phase 1: Project Setup

### Step 1.1: Install Development Tools
- [x] Download and install [Haxe](https://haxe.org/download/)
- [x] Install [Haxe Flixel](https://haxeflixel.com/documentation/installation/)
- [ ] Verify Haxe and Haxe Flixel installations via command line

### Step 1.2: Set Up IDE
- [ ] Install [Visual Studio Code](https://code.visualstudio.com/) (or preferred Haxe-compatible IDE)
- [ ] Install necessary extensions for Haxe and Haxe Flixel

### Step 1.3: Initialize Git and GitHub Repository
- [ ] Initialize Git in the project directory
- [ ] Create a `.gitignore` file excluding `assets/`, `build/`, and compiled/temp files
- [ ] Make the initial commit with the message "Initial project setup with directory structure and build configuration"
- [ ] Create a new repository on GitHub named "OpenStackHouse"
- [ ] Push the local repository to GitHub and set the remote origin

### Step 1.4: Configure Project Structure
- [ ] Create the following directories:
  - `assets/graphics`
  - `assets/audio`
  - `src/`
  - `build/`
- [ ] Set up the `build.hxml` configuration file targeting HTML5 for web deployment

---

## Phase 2: Core Architecture Development

### Step 2.1: Implement Game States Framework
- [ ] Define base game states using Haxe Flixel’s state management
- [ ] Create placeholder classes for:
  - Main Menu
  - Gameplay
  - Pause
  - Game Over
- [ ] Implement state transitions between states

### Step 2.2: Set Up Main Game Loop
- [ ] Initialize the game in the Main Menu state
- [ ] Ensure the game transitions to Gameplay state upon starting

### Step 2.3: Develop Asset Loader
- [ ] Create functions to load graphics assets
- [ ] Create functions to load audio assets
- [ ] Organize placeholders for graphics and audio assets
- [ ] Test asset loading with placeholder assets

---

## Phase 3: Player Mechanics

### Step 3.1: Design and Import Player Sprite Sheet
- [ ] Design or source a retro-style, pixelated player character sprite sheet
- [ ] Ensure the sprite sheet includes animations for idle, walking, and jumping
- [ ] Import the sprite sheet into the `assets/graphics/` directory
- [ ] Reference the sprite sheet in the asset loader
- [ ] Verify idle animation plays by default in the Gameplay state

### Step 3.2: Implement Player Class with Movement
- [ ] Create a `Player` class extending `FlxSprite` in the `src/` directory
- [ ] Initialize the player with position, velocity, and state properties
- [ ] Add methods for movement and animation control

### Step 3.3: Code Player Movement
- [ ] Implement left movement using the left arrow key
- [ ] Implement right movement using the right arrow key
- [ ] Ensure movement is smooth and responsive
- [ ] Add boundary checks to keep the player within the 8x7 playfield grid

### Step 3.4: Develop Jumping Mechanics
- [ ] Implement jump initiation using the up arrow and X key
- [ ] Set consistent jump height unaffected by carrying blocks
- [ ] Allow mid-air direction changes (left/right) during jumping or falling
- [ ] Ensure jump animations play correctly during the jump action
- [ ] Return to idle or walking animation upon landing

### Step 3.5: Implement Block Interaction
- [ ] Add ability to pick up blocks using the Z key
- [ ] Enable dropping blocks in the direction the player is facing
- [ ] Enforce carry limitation of one block at a time
- [ ] Allow block pickup and drop while in mid-air (jumping or falling)

---

## Phase 4: Block Mechanics

### Step 4.1: Create Block Entities
- [ ] Define a `Block` class extending `FlxSprite` in the `src/` directory
- [ ] Add properties for `number` and `color`
- [ ] Assign colors based on block numbers (1-10) as specified
- [ ] Ensure numbers are centered and legible on blocks
- [ ] Add animations or visual effects for merging and disappearing behaviors
- [ ] Test block instantiation by spawning blocks in the Gameplay state

### Step 4.2: Implement Block Spawning
- [ ] Define predefined spawn columns within the playfield
- [ ] Code logic to spawn blocks at these columns
- [ ] Display upward-facing arrow indicators at spawn points for ~1 second before spawning
- [ ] Set initial spawn interval to 5 seconds
- [ ] Implement spawn rate scaling based on the player's score, decreasing linearly down to a minimum of 1 second

### Step 4.3: Develop Block Falling Behavior
- [ ] Set constant falling velocity so blocks take ~4-5 seconds to fall from top to bottom
- [ ] Implement collision detection with the playfield floor and other blocks
- [ ] Snap blocks to the nearest 8x8 pixel grid upon landing
- [ ] Ensure blocks do not snap during fall and snapping occurs smoothly upon collision

### Step 4.4: Code Block Merging Logic
- [ ] Detect when two blocks of the same number collide or stack vertically
- [ ] Merge them into a single block with the next higher number
- [ ] Award 10 points per merge
- [ ] Update the score display in real-time
- [ ] Handle chain reactions by allowing multiple instantaneous merges
- [ ] Implement special case for block number 10 to disappear after 2 seconds if not merged

### Step 4.5: Implement Scoring System
- [ ] Award 10 points for each individual merge
- [ ] Accumulate points during chain reactions
- [ ] Update the 6-digit score display with leading zeros in real-time

---

## Phase 5: User Interface (UI) and HUD

### Step 5.1: Design Score Display
- [ ] Create a 6-digit retro-style score display with leading zeros
- [ ] Position the score display at the bottom of the screen
- [ ] Ensure the score updates dynamically as points are earned

### Step 5.2: Develop Reticle Indicator
- [ ] Implement a reticle adjacent to the player based on facing direction (left or right)
- [ ] Ensure the reticle snaps to the 8x8 pixel grid positions
- [ ] Indicate the target block for pickup or the drop location for placed blocks
- [ ] Update the reticle position dynamically with player movement and direction changes

### Step 5.3: Create Main Menu Screen
- [ ] Design the Main Menu with the game title "Open Stack House" in a prominent pixelated font
- [ ] Add a clickable Start Game button
- [ ] Implement navigation to the Gameplay state upon clicking the Start button

### Step 5.4: Develop Pause Functionality
- [ ] Implement pause functionality triggered by the P key
- [ ] Display a pause symbol (e.g., VCR-like icon) at the upper right corner (~1 tile in size)
- [ ] Freeze all game actions (player movement, block falling, spawn intervals) when paused
- [ ] Allow resuming the game by pressing the P key again
- [ ] Enable restarting the game from the pause state using the R key

### Step 5.5: Create Game Over Screen
- [ ] Design the Game Over screen with the text "Game Over" prominently displayed
- [ ] Display the player's final score
- [ ] Retrieve and display the high score from LocalStorage
- [ ] Update the high score in LocalStorage if the player's score exceeds it
- [ ] Provide instructions such as "Press R to Restart"
- [ ] Ensure the Game Over screen maintains the retro aesthetic

---

## Phase 6: Audio Integration

### Step 6.1: Add Sound Effects
- [ ] Import sound assets for:
  - Jumping
  - Picking up blocks
  - Dropping blocks
  - Merging blocks
  - Block landing
  - Game over
- [ ] Trigger appropriate sound effects based on in-game actions

### Step 6.2: Integrate Background Music
- [ ] Import a looping upbeat retro-style background music track
- [ ] Ensure seamless looping without noticeable gaps or repetition artifacts
- [ ] Play background music during gameplay

### Step 6.3: Implement Mute/Unmute Functionality
- [ ] Add the ability to mute/unmute all sounds using the M key
- [ ] Implement an event listener for the M key to toggle mute state
- [ ] Silently toggle all sound effects and background music based on mute state
- [ ] Optionally, display a visual indicator of the mute state on the screen

---

## Phase 7: Performance Optimization

### Step 7.1: Optimize Asset Loading
- [ ] Consolidate individual sprites into sprite sheets where applicable
- [ ] Reference sprite sheets efficiently in the code to minimize memory usage

### Step 7.2: Minimize Asset Sizes
- [ ] Compress graphic assets without compromising quality
- [ ] Compress audio files to reduce load times
- [ ] Ensure quick loading times across devices

### Step 7.3: Profile and Optimize Code
- [ ] Use profiling tools to identify performance bottlenecks
- [ ] Optimize game loop and rendering processes to maintain 60 FPS
- [ ] Optimize asset handling to ensure smooth performance

---

## Phase 8: Data Handling and Storage

### Step 8.1: Implement High Score Persistence
- [ ] Use the browser's LocalStorage API to save the high score
- [ ] Create functions to save the high score upon achieving a new record
- [ ] Retrieve the high score upon game start
- [ ] Display the high score on the Game Over screen
- [ ] Handle cases where LocalStorage is unavailable with fallback mechanisms or console warnings

### Step 8.2: Configure Spawn Rate Parameters
- [ ] Define variables for:
  - Initial spawn interval (5 seconds)
  - Spawn rate scaling factor (linear decrease)
  - Minimum spawn interval (1 second)
- [ ] Allow easy adjustments through configuration files or constants

---

## Phase 9: Testing and Quality Assurance

### Step 9.1: Conduct Unit Tests
- [ ] Test individual components:
  - Player movement mechanics
  - Block merging logic
  - Scoring system
- [ ] Ensure each component functions correctly in isolation

### Step 9.2: Perform Integration Tests
- [ ] Verify that combined systems interact seamlessly
  - Example: Block merging correctly triggers score updates
  - UI reflects score changes in real-time
- [ ] Ensure smooth interaction between player actions and block mechanics

### Step 9.3: Execute UI and Performance Tests
- [ ] Check visual consistency of sprites, animations, and UI elements
- [ ] Verify the reticle indicator accurately points to interaction targets
- [ ] Test game scaling across different screen resolutions
- [ ] Confirm the game maintains 60 FPS across supported browsers and devices

### Step 9.4: Undertake User Acceptance Testing (UAT)
- [ ] Conduct playtesting sessions with different users
- [ ] Gather feedback on gameplay mechanics, difficulty progression, and overall enjoyment
- [ ] Refine game balance, control responsiveness, and visual/audio elements based on feedback
- [ ] Document and fix any identified bugs or issues

---

## Phase 10: Deployment

### Step 10.1: Prepare Deployment Build
- [ ] Optimize and bundle all assets for web deployment
- [ ] Configure build settings for production mode
- [ ] Ensure all assets are correctly referenced and loaded

### Step 10.2: Deploy to Web Platform
- [ ] Create a `gh-pages` branch in the GitHub repository
- [ ] Push the build files to the `gh-pages` branch
- [ ] Configure GitHub Pages to serve the game from the `gh-pages` branch
- [ ] Test the live version of the game via the GitHub Pages URL
- [ ] Verify that all features work correctly and no deployment issues exist
