# GTAMusic Addon for Garry's Mod

## Overview
GTAMusic is a work-in-progress Garry's Mod (GMod) addon that brings the dynamic and interactive music system inspired by *Grand Theft Auto V / Red Dead Redemption / Max Payne 3* to your GMod experience. This addon allows players to control and customize music playback using layered audio stems, enabling dynamic music transitions based on intensity levels, similar to GTA V's adaptive soundtrack system. It includes a user-friendly interface for selecting music sets, toggling individual stems, adjusting volume, fade times, playback rates, and more.

## Features
- **Dynamic Music System**: Play music sets with up to 12 individual stems, allowing for real-time layering and dynamic transitions.
- **Intensity-Based Playback**: Switch between predefined intensity levels (e.g., low, medium, high) to change the active stems, mimicking GTA V's adaptive music.
- **Randomized Playback**: Options to randomize music sets on spawn or switch intensity combinations every 30-45 seconds for a varied experience.
- **Customizable Settings**:
  - Adjust overall music volume (0-1).
  - Set fade in/out duration (0-10 seconds).
  - Modify playback speed (0.5x to 2x).
  - Enable debug mode for detailed HUD and console output.
- **User Interface**: Two VGUI panels:
  - **Main Menu**: Select music sets, organized by game origin and category, with options to randomize sets, reload data, or stop playback.
  - **Stem Controller**: Toggle individual stems, randomize stem combinations, or return to the main menu.
- **Modular Music Data**: Supports loading music sets from `music_data.lua` and additional `music_data_*.lua` files for easy expansion.

## Installation
1. **Download**: Clone or download the addon from this GitHub repository.
2. **Place in GMod Addons Folder**:
   - Copy the addon folder to `garrysmod/addons/`.
   - The file path should be `garrysmod/addons/GTA Music/`
   - Ensure the folder structure includes `lua/autorun/client/music_data.lua` and any additional `music_data_*.lua` files for custom music sets.

## Usage
### Console Commands
- `gtamusic_menu`: Open the main music controller menu.
- `gtamusic_stemmenu`: Open the stem controller menu.
- `gtamusic_triggerstem <number>`: Toggle a specific stem (1-12).
- `gtamusic_triggerintensity <intensity>`: Activate a specific intensity level (e.g., `low`, `medium`, `high`).
- `gtamusic_stop`: Stop all active stems.
- `gtamusic_randomize_stems`: Randomize 2-4 stems for the current set.
- `gtamusic_randomize_musicset`: Switch to a random music set.
- `gtamusic_reload_data`: Reload music data from `music_data.lua` and modular files.

### Console Variables (ConVars)
- `gtamusic_volume <0-1>`: Set overall music volume (default: 0.6).
- `gtamusic_fadetime <0-10>`: Set fade in/out duration in seconds (default: 2.0).
- `gtamusic_playbackrate <0.5-2>`: Set playback speed multiplier (default: 1.0).
- `gtamusic_debug <0-1>`: Enable debug prints and HUD (default: 0).
- `gtamusic_setname <set>`: Select a music set (e.g., `alc_vodka`, `alc_pb2_pussyface`, `nrt4`, `nybar`, `cemetery`, `td_vacuum`).
- `gtamusic_randomize_intensity <0-1>`: Enable random intensity switching every 30-45 seconds (default: 0).
- `gtamusic_randomset <0-1>`: Randomize music set on spawn (default: 1).

### In-Game Interface
- **Main Menu**:
  - Select music sets from a categorized list (sorted by game and category).
  - Buttons for randomizing sets, reloading data, stopping music, or opening the stem controller.
  - Sliders for volume, fade time, and playback rate.
  - Checkboxes for random set on spawn and random intensity cycling.
  - Info panel displaying track name, game origin, composer, category, and available intensities.
- **Stem Controller**:
  - Toggle individual stems (up to 12) with visual feedback (green for active, gray for inactive).
  - Buttons to clear all stems, randomize 2-4 stems, or return to the main menu.
- **Debug HUD** (when `gtamusic_debug 1`):
  - Displays current set, active stems, intensity level, and time until the next intensity cycle (if enabled).

## Music Data Configuration
- Default Music sets are defined in `lua/autorun/client/music_data.lua` and optional / modular `music_data_*.lua` files.
- Each set includes:
  - `name`: Display name of the track.
  - `path`: Relative path to audio files (e.g., `alc_vodka/`).
  - `stems`: List of stem filenames (e.g., `{"stem1.wav", "stem2.wav"}`).
  - `intensity`: Table of intensity levels mapping to stem combinations (e.g., `{ low = {1, 2}, high = {1, 3, 4} }`).
  - `gameOrigin`: Source game (e.g., "Grand Theft Auto V").
  - `category`: Optional category for organization (e.g., "Doomsday Heist").
  - `composer`: Composer of the track.
- Example:
```lua
return {
	alc_vodka = { 								-- Mandatory Prep: alc_vodka is the intenral name for the set
		name = "ALC Vodka",     				-- Mandatory Prep: This will be the name shown in the menu 
		gameOrigin = "Grand Theft Auto V",		-- Mandatory Prep: The tab where the music will be under
		composer = "The Alchemist",				-- Optional Prep: just fun little info
		--category = "", 						-- Optional Prep: Category for sub-menus for organization. This is optional, as you do not need it, if you don't need it.
		path = "gta5/story/alc_vodka/",			-- Mandatory Prep: The file path location for the set.
		stems = {								-- Mandatory Prep: Stem setup for the set.
			"ALC_GUN_NOVEL_1.mp3",
			"ALC_GUN_NOVEL_2.mp3",
			"ALC_GUN_NOVEL_3.mp3"
		},
		intensity = {							-- Optional Prep: You can define your own intensity and set it here to be used in the menu. You can add your own intensities down
			low = {1},							-- There's no "forced names here, you can use any name you want.
			medium = {1, 2},
			high = {1, 2, 3}
		},
	}
}
```

## Known Issues
- The addon is still in development and may have bugs or incomplete features.
- Some intensity levels may not trigger correctly if improperly defined in `music_data.lua`.
- This may or may not function in Multiplayer as I have no means to test this in multiplayer, so it is mainly Singleplayer. 
- Server to client sync may lag, especially with frequent stem or set changes, or the player's FPS going low.
