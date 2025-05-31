# fireboy-and-watergirl

A simple interpretation of the classic "Fireboy and Watergirl" game, implemented in [Godot Engine 4](https://godotengine.org/). This project demonstrates fundamental game development concepts such as character movement, collision detection, level design, and cooperative puzzle mechanics.

## Features

- **Godot 4 project**: written in GDScript for Godot 4.x
- Two playable characters: Fireboy and Watergirl
- Cooperative, local multiplayer gameplay—both players must work together to solve levels
- Elevators/lifts for vertical movement
- Pools of water, lava, and toxin (hazards and puzzles)
- Simple collision and platforming mechanics
- Level objectives: get both characters to their exits

## Controls

- **Fireboy:** `W`, `A`, `S`, `D` keys
- **Watergirl:** Arrow keys (`↑`, `↓`, `←`, `→`)

## Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/TheSebitzu/fireboy-and-watergirl.git
   ```

2. **Open in Godot 4:**
   - Launch Godot 4.x
   - Click "Import" or "Open Project"
   - Select the `fireboy-and-watergirl` folder

3. **Run the game:**
   - Click the "Play" button in Godot (`F5` or the green triangle)
   - Controls for Fireboy and Watergirl are shown above and in code comments

## How It Works

- The game uses Godot’s node and scene system for all entities and mechanics.
- Elevators are implemented as moving platforms that can transport players vertically.
- Pools of water, lava, and toxin act as hazards—each character is immune to one type and vulnerable to others.
  - Fireboy: immune to lava, dies in water or toxin
  - Watergirl: immune to water, dies in lava or toxin
- Both players must reach their respective exits to complete a level.

## Limitations

- **No sound or advanced graphics:** Focus on gameplay and mechanics
- **Local multiplayer only:** Both players on the same keyboard/controller
- **Requires Godot 4** to run or edit

## Requirements

- [Godot Engine 4.x](https://godotengine.org/)

## License

This project is licensed under the MIT License.

---

*Made by [TheSebitzu](https://github.com/TheSebitzu)*
