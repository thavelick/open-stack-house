## **1. Overview**

**Open Stack House** is a web-based, retro-style, low-resolution puzzle game where players control a Mario-like character who can jump to pick up and place numbered blocks. The objective is to merge blocks of the same number to achieve higher numbers and accumulate the highest possible score before the playfield fills up or a block lands on the player. The game emphasizes simple mechanics, strategic block placement, and increasing difficulty through spawn rate scaling.

---

## **2. Technical Specifications**

### **a. Target Platform**

- **Web Browser:** The game will be developed for modern web browsers, including:
  - **Desktop Browsers:** Chrome, Firefox, Edge, Safari.
  - **Mobile Browsers:** Mobile compatibility is optional for V1 but can be considered for future updates.

### **b. Screen Resolution**

- **Internal Game Grid:**
  - **Grid Size:** 64x64 pixels.
  - **Tile Size:** 8x8 game-pixels, resulting in an 8x8 grid.
- **Playfield:**
  - **Dimensions:** 8 columns (width) x 7 rows (height) for the active play area, with the lowest row for floor tiles.
- **Display Scaling:**
  - Graphics will be scaled to fit the user's screen resolution while maintaining the chunky, pixelated aesthetic.
- **Total Game Area:**
  - **Grid:** 8x8 tiles (64x64 pixels).
  - **HUD Integration:** The score display will occupy additional space within the grid layout.

### **c. Frame Rate**

- **Target Frame Rate:** 60 Frames Per Second (FPS) for smooth animations and responsive controls.

### **d. Input Devices**

- **Primary Controls:**
  - **Keyboard:**
    - **Arrow Keys:**
      - **Left/Right Arrows:** Move the player character horizontally.
      - **Up Arrow:** Jump.
    - **X Key:** Jump (alternative to Up Arrow).
    - **Z Key:** Pick up or drop a block.
    - **P Key:** Pause the game.
    - **R Key:** Restart the game.
    - **M Key:** Mute/unmute sound.
- **Future Considerations:**
  - **Gamepads:** Support standard controllers (optional for V2+).
  - **Touch Controls:** Implement touch gestures for mobile devices (optional for future versions).

### **e. Performance Requirements**

- **Minimum Specifications:**
  - **CPU:** Basic CPU capable of handling 2D sprite rendering and simple physics (e.g., Intel Core i3 or equivalent).
  - **GPU:** Integrated graphics support Haxe Flixel’s rendering (e.g., Intel HD Graphics).
  - **Memory:** At least 2 GB RAM.
- **Optimization Goals:**
  - Utilize sprite sheets and efficient asset loading.
  - Minimize memory usage to ensure smooth performance on a wide range of devices.

---

## **3. Game Mechanics**

### **a. Player Character**

- **Appearance:**
  - **Style:** Retro, pixelated, Mario-like character.
  - **Size:** 1x1 tile (8x8 game-pixels).
- **Abilities:**
  - **Movement:** Left and right within the playfield boundaries.
  - **Jumping:** Consistent jump height, unaffected by carrying blocks.
  - **Block Interaction:** Can pick up and drop one block at a time.
- **Animations:**
  - **Idle Animation:** Simple breathing or slight movement.
  - **Walking Animation:** Side-to-side movement with 2-3 frames for smoothness.
  - **Jumping Animation:** Upward movement with bending or stretching effects.

### **b. Controls**

- **Movement:**
  - **Left/Right Arrow Keys:** Move the player character horizontally.
- **Jumping:**
  - **Up Arrow / X Key:** Initiate a jump.
  - **Mid-air Direction Change:** Ability to change direction while in the air, similar to Mario's mechanics.
- **Block Manipulation:**
  - **Z Key:** Pick up or drop a block from the adjacent cell based on the direction the player is facing.
  - **Restrictions:**
    - **Carry Limit:** The player can carry only one block at a time.
    - **Mid-Air Interaction:** Players can pick up or drop blocks while jumping or falling.
- **Game Management:**
  - **P Key:** Pause the game.
  - **R Key:** Restart the game upon game over or during play.
  - **M Key:** Mute or unmute all game sounds.

### **c. Blocks**

- **Properties:**
  - **Size:** 1x1 tile (8x8 game-pixels).
  - **Colors and Numbers:**
    - **1:** Grey
    - **2:** Dark Brown
    - **3:** Light Brown
    - **4:** Orange
    - **5:** Red
    - **6:** Yellow
    - **7:** Dark Green
    - **8:** Lighter Green
    - **9:** Light Blue
    - **10:** Purple
- **Behavior:**
  - **Spawning:**
    - Blocks appear at predefined columns with an up arrow indicator.
    - Initial spawn interval of 5 seconds, decreasing linearly with the player's score until a minimum threshold.
  - **Falling:**
    - **Velocity:** Constant velocity; takes approximately 4-5 seconds to fall from the top to the bottom of the screen.
    - **Grid Interaction:** Blocks do not snap to the grid during the fall; snapping occurs upon landing.
  - **Merging:**
    - **Mechanism:** Two blocks of the same number merge into a higher-numbered block.
    - **Scoring:** Each merge triggers a 10-point score increment.
    - **Chain Reactions:** Multi-level merges occur almost instantaneously, allowing for chain reactions that cumulatively add points.
    - **Special Case:** Block 10 disappears after 2 seconds without merging.
  - **Interactions:**
    - **Obstruction:**
      - Blocks block the player's movement if occupying the adjacent cell.
      - Blocks landing on the player result in game over.
    - **Stacking Limits:**
      - Reaching the top of the playfield with stacked blocks results in game over.
  - **Disappearance Effects:**
    - When a block disappears due to merging, any blocks above it fall at the same velocity as blocks falling from the top.

### **d. Spawn Mechanics**

- **Spawn Rate Scaling:**
  - **Linear Increase:** Spawn frequency increases linearly as the player's score increases.
  - **Cap:** Spawn rate does not exceed a predefined minimum interval to prevent impossible game states.
- **Spawn Timing Parameters:**
  - **Initial Interval:** 5 seconds between spawns.
  - **Minimum Interval:** 1 second *(Final value to be confirmed based on playtesting)*.
- **Spawn Indicators:**
  - **Up Arrow:**
    - **Design:** 1-tile-sized upward-facing arrow.
    - **Duration:** Visible for approximately 1 second before the block spawns.
    - **Position:** Top of the intended spawn column.

### **e. Reticle Mechanics**

- **Purpose:** Indicates the block the player will interact with (pick up or drop).
- **Design:**
  - **Appearance:** A distinct, clearly visible UI element (e.g., a highlighted box or marker) adjacent to the player.
  - **Size:** 1x1 tile, consistent with block and player dimensions.
- **Behavior:**
  - **Placement:** Positioned in the grid cell directly next to the player based on the direction the player is facing (left or right).
  - **Snapping:** The reticle snaps to the block tile grid, ensuring precise alignment with potential target blocks.
  - **During Pickup:**
    - **Pickup Action:** When the player presses the Z key to pick up a block, the block in the reticle's position is lifted.
    - **Reticle Update:** The reticle shifts to show the destination cell where the block will be dropped.
    - **Visual Feedback:** The reticle remains visible in front of the player sprite, indicating where the block will be placed upon dropping.
- **Interactions:**
  - **Obstacle Avoidance:** The reticle does not obstruct the player's movement or actions.
  - **Dynamic Updates:** The reticle updates its position in real-time based on player movement and direction changes, including mid-air movements.

### **f. Scoring System**

- **Points Allocation:**
  - **Per Merge:** +10 points.
  - **Chain Reactions:** Each individual merge in the chain reaction awards an additional 10 points.
- **Score Display:**
  - **Format:** 6-digit display with leading zeros (e.g., 000012).
  - **Position:** Bottom of the screen, always visible.
- **High Score Tracking:**
  - **Storage:** Locally stored high score using browser storage (e.g., LocalStorage).
  - **Display:** Shown on the Game Over screen.

### **g. Game Progression**

- **Gameplay Type:** Endless, with increasing difficulty through spawn rate scaling.
- **Objective:** Achieve the highest possible score by merging blocks and preventing the playfield from filling up.
- **End Conditions:**
  - A block lands on the player.
  - Stacks of blocks reach the top of the playfield.

---

## **4. User Interface (UI) and User Experience (UX)**

### **a. HUD Elements**

- **Score Display:**
  - **Position:** Bottom of the screen.
  - **Design:** 6-digit retro pixelated font with leading zeros.
  - **Behavior:** Updates in real-time as points are earned.

- **Reticle Indicator:**
  - **Position:** Adjacent to the player character, reflecting the direction faced (left or right).
  - **Design:** 1x1 tile-sized marker (e.g., highlighted box or arrow) that snaps to the grid.
  - **Functionality:** Indicates the target block for pickup or the drop location for placed blocks.

### **b. Menus and Screens**

- **Main Menu/Title Screen:**
  - **Elements:**
    - **Game Title:** "Open Stack House" in a prominent, pixelated font.
    - **Start Game Button:** Clickable button to initiate gameplay.
  - **Design:** Simple layout with centered elements for clarity.

- **Pause State:**
  - **Visual:** Regular game screen with a pause symbol (e.g., VCR-like icon) at the upper right corner (~1 tile in size).
  - **Functionality:** Game state freezes; all movements and countdowns halt until resumed or restarted.

- **Game Over Screen:**
  - **Elements:**
    - **Text:** "Game Over" prominently displayed.
    - **Final Score:** Player's score at game end.
    - **High Score:** Highest score achieved stored locally.
    - **Restart Instruction:** "Press R to Restart".
  - **Design:** Centralized and readable text with consistent retro styling.

### **c. Instructions Display**

- **Placement:** Displayed on the Game Over screen or as an initial prompt on the Main Menu.
- **Content:** Simple, concise instructions summarizing game objectives and control mappings to assist players without overwhelming them.

### **d. Menus Exclusion**

- **Settings and Tutorials:** Not included in version 1.0. Incorporate basic instructions within the Game Over screen or as an initial prompt if necessary.

---

## **5. Visual and Audio Assets**

### **a. Graphics**

- **Art Style:** Retro, pixelated with a chunky feel to maintain low-resolution aesthetics.

- **Player Character:**
  - **Idle Animation:** Simple breathing or slight movement.
  - **Walking Animation:** Side-to-side movement with 2-3 frames for smoothness.
  - **Jumping Animation:** Upward movement with bending or stretching effects.

- **Blocks:**
  - **Design:** 1x1 tile size with distinct colors and centered, legible numbers (1-10).
  - **Merging Effect:** Brief flash or glow upon merging.
  - **Block 10:** Fade-out or shrinking animation over 2 seconds before disappearing.

- **Reticle Indicator:**
  - **Design:** A distinct marker (e.g., highlighted box or arrow) that aligns with the grid.
  - **Behavior:** Snaps to grid positions based on player direction and interaction targets.

- **Background:**
  - **Design:** Simple, non-distracting pixelated background with neutral colors (e.g., dark shades) to enhance block visibility.

### **b. Sound Effects**

- **Jumping:** Distinct sound upon jumping.
- **Picking Up Blocks:** Sound indicating successful pickup.
- **Dropping Blocks:** Sound for placing or dropping a block.
- **Merging Blocks:** Satisfying sound effect upon merging.
- **Block Landing:** Sound when a block lands on the ground or a stack.
- **Game Over:** Unique sound signaling the end of the game.

### **c. Background Music**

- **Type:** Single, upbeat looping track that complements the retro aesthetic.
- **Looping:** Seamless looping without noticeable gaps or repetition artifacts.

### **d. Audio Management**

- **Mute Functionality (M Key):** Toggles all sound effects and background music on/off.
- **Volume Levels:** Balanced to ensure clarity of important sounds, with background music slightly subdued to avoid distraction.

---

## **6. Architecture and Technology Stack**

### **a. Primary Framework**

- **Haxe Flixel:** Utilize Haxe Flixel as the main game framework for 2D game development in Haxe.

### **b. Additional Libraries**

- **Audio Handling:** Use Haxe Flixel's built-in audio capabilities. Consider integrating additional audio libraries if necessary for advanced features.
- **Input Management:** Leverage Haxe Flixel’s input handling for keyboard controls. Ensure responsiveness and support for future input methods.

### **c. Development Tools**

- **IDE:** Visual Studio Code, IntelliJ IDEA, or any preferred Haxe-compatible IDE.
- **Version Control:** Git for source code management.
- **Repository Hosting:** GitHub for repository management and collaboration.

---

## **7. Data Handling and Storage**

### **a. High Score Storage**

- **Method:** Utilize browser's LocalStorage API to persist high scores locally.
- **Data Structure:**
  ```json
  {
    "highScore": 000000
  }
  ```
- **Access:**
  - **Save:** Upon achieving a new high score.
  - **Retrieve:** On game start and display on the Game Over screen.

### **b. Configuration Parameters**

- **Spawn Rate Parameters:** Define initial spawn interval, spawn rate scaling factor, and minimum spawn interval as configurable variables within the code for easy adjustments.
- **Audio Settings:** Store mute state in session; no persistence required as the game doesn't require saving.

---

## **8. Error Handling Strategies**

### **a. Input Validation**

- **Control Inputs:** Ensure all key presses correspond to defined actions. Ignore undefined keys to prevent unexpected behavior.

### **b. Asset Loading Errors**

- **Fallbacks:** Implement checks to confirm all assets (sprites, sounds) load correctly. Display console warnings or fallback visuals/sounds if any assets fail to load.

### **c. Game State Management**

- **Invalid States:** Prevent transitions to undefined game states. For example, disallow game over during active gameplay.
- **Graceful Failures:** In case of unexpected errors, reset the game state to Main Menu and notify the user via console logs.

### **d. Browser Compatibility**

- **Feature Detection:** Verify that the user's browser supports required features (e.g., LocalStorage, Web Audio API). Provide console warnings if unsupported.

---

## **9. Testing Plan**

### **a. Unit Testing**

- **Gameplay Mechanics:**
  - **Block Merging:** Verify that two blocks of the same number merge correctly into the next number and award points appropriately.
  - **Chain Reactions:** Ensure multi-level merges occur instantaneously and award cumulative points.
  - **Block 10 Behavior:** Confirm that block 10 disappears after 2 seconds without disrupting game state.

- **Player Controls:**
  - **Movement:** Test left, right movements and ensure collision detection with blocks.
  - **Jumping:** Validate consistent jump height and mid-air direction changes.
  - **Block Interaction:** Ensure correct block pickup and drop mechanics based on facing direction.
  - **Mid-Air Pickup/Drop:** Verify that players can pick up and drop blocks while jumping or falling.

- **Spawn Mechanics:**
  - **Spawn Rate Scaling:** Verify that spawn intervals decrease linearly with increasing scores up to the minimum threshold.
  - **Spawn Indicators:** Check the appearance and duration of up arrows before block spawning.

### **b. Integration Testing**

- **UI Elements:**
  - **Score Display:** Ensure real-time updates and correct formatting (6 digits with leading zeros).
  - **Reticle Indicator:** Test reticle positioning relative to player direction and interaction targets.
  - **Menus and Screens:** Test transitions between Main Menu, Gameplay, Pause, and Game Over screens.

- **Audio Functionality:**
  - **Sound Effects:** Verify that all sound effects trigger appropriately based on in-game actions.
  - **Mute Functionality:** Ensure all audio toggles correctly with the M key.

### **c. User Interface Testing**

- **Visual Consistency:** Check all sprites, animations, and UI elements for consistency with the retro pixelated aesthetic.
- **Reticle Functionality:** Ensure the reticle accurately indicates interaction targets and updates dynamically with player movements.
- **Responsive Design:** Ensure the game scales correctly across different screen resolutions without graphical distortions.

### **d. Performance Testing**

- **Frame Rate:** Confirm that the game maintains a steady 60 FPS across supported devices and browsers.
- **Asset Loading:** Ensure all assets load efficiently without significant delays or performance hitches.

### **e. User Acceptance Testing (UAT)**

- **Playtesting:** Conduct playtests with different users to gather feedback on gameplay mechanics, difficulty progression, and overall enjoyment.
- **Feedback Integration:** Incorporate feedback to refine game balance, controls responsiveness, and visual/audio elements.

### **f. Cross-Browser Compatibility Testing**

- **Supported Browsers:** Test the game across Chrome, Firefox, Edge, and Safari to ensure consistent behavior and appearance.
- **Error Logs:** Monitor browser console for any errors or warnings during gameplay.

---

## **10. Development Milestones and Timeline**

*(Note: This section should outline key development phases, deadlines, and deliverables. Since specific timelines depend on team size and resources, it is recommended to collaborate with the development team to populate this section accordingly.)*

---

## **11. Additional Considerations**

### **a. Localization**

- **Initial Release:** English only.
- **Future Updates:** Structure code to support easy addition of multiple languages if desired.

### **b. Accessibility**

- **Colorblind Mode:** Not necessary for V1 as block numbers convey information.
- **Alternative Indicators:** Ensure that all critical game information is conveyed through both visual and auditory means.

### **c. Future Enhancements (V2+)**

- **Power-Ups and Special Items:** Introduce new mechanics to enhance gameplay.
- **Additional Soundtracks:** Expand audio variety.
- **Settings Menu:** Allow customization of controls and audio preferences.
- **Leaderboard Implementation:** Online high score tracking and leaderboards.
- **Mobile Support:** Optimize for touch controls and different screen sizes.

---

# **Conclusion**

This comprehensive and enhanced specification document ensures that **Open Stack House** encompasses all envisioned mechanics, aesthetics, and user experiences derived from the initial idea and brainstorming session. By adhering to these detailed guidelines, developers can proceed with a clear and structured roadmap, facilitating the creation of a polished and engaging final product. Regular reviews and iterative testing based on feedback will further refine the game, ensuring it meets player expectations and delivers an enjoyable retro gaming experience.
