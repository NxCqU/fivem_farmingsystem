# NxCqU Farming System

## Features
- **Modular farming routes:** Predefined routes for Weed, Wine, and Iron.
- **UI interaction:** Press `E` to open the menu for gathering, processing, and selling.
- **Animations:** Unique animations for each action (gathering, processing, selling).
- **Blips on the map:** Each route is marked on the map with customizable names and colors.
- **Configurable:** Easily adjust item names, prices, locations, and action durations in the `Config.lua` file.

---

## Installation

### 1. **Download and Add Resource**
   - Clone or download this repository.
   - Place it into your server’s `resources/` folder.
   - Rename the folder to `nxcqu_farming_system`.

### 2. **Update server.cfg**
   Add the following line to your `server.cfg` to ensure the resource is started:
   ```plaintext
   ensure nxcqu_farming_system
   ```

### 3. **Restart Your Server**
   Restart your server to load the script. You should see the blips on the map and can interact with the farming locations.

---

## How to Use
1. **Navigate to a farming location:** Open the map and locate the blips for Weed, Wine, or Iron.
2. **Press `E` to interact:** When near a location (gathering, processing, or selling), press `E` to open the UI.
3. **Start an action:**
   - Choose to "Gather", "Process", or "Sell" in the UI.
   - The UI will automatically close when the action begins, and animations will play during the process.
4. **Repeat the process:** Cycle between gathering, processing, and selling to earn money and interact with the system.

---

## Configuration Guide
The script is designed to be fully configurable through the `Config.lua` file. Here’s how you can adjust the key settings:

### 1. **Adjust Prices, Locations, and Quantities**
   Open the `Config.lua` file and edit the following:

   ```lua
   Config = {
       Routes = {
           Weed = {
               GatherLocation = vector3(1903.5, 4921.4, 48.8), -- Coordinates for gathering
               ProcessLocation = vector3(2563.5, 4685.4, 33.1), -- Coordinates for processing
               SellLocation = vector3(-1172.2, -1571.4, 4.6), -- Coordinates for selling
               GatherItem = 'weed_buds', -- Item collected at gather location
               ProcessItem = 'weed', -- Item produced at process location
               GatherAmount = {min = 1, max = 3}, -- Quantity range for gathering
               ProcessAmount = 5, -- Required quantity to process
               SellPrice = {min = 200, max = 250}, -- Price range for selling
               BlipColor = 2, -- Blip color on the map
               BlipName = 'Weed Farming' -- Name of the blip on the map
           }
       }
   }
   ```

   **Example Adjustments:**
   - **Change Prices:** Edit `SellPrice = {min = 200, max = 250}` to set a new price range.
   - **Change Quantities:** Adjust `GatherAmount` or `ProcessAmount` for desired item yields.
   - **Update Locations:** Use a tool like [Coords Tool](https://www.gta5-mods.com/tools/coords-tool) to get new coordinates and update `GatherLocation`, `ProcessLocation`, and `SellLocation`.

### 2. **Add New Farming Routes**
   To add a new farming route, duplicate an existing route in `Config.lua` and customize it:

   **Example: Add "Gold Mining"**
   ```lua
   Gold = {
       GatherLocation = vector3(2974.5, 2793.2, 40.9),
       ProcessLocation = vector3(1100.4, -3100.5, 5.9),
       SellLocation = vector3(-500.3, -200.6, 39.2),
       GatherItem = 'gold_ore',
       ProcessItem = 'gold_bar',
       GatherAmount = {min = 1, max = 3},
       ProcessAmount = 3,
       SellPrice = {min = 500, max = 800},
       BlipColor = 5,
       BlipName = 'Gold Mining'
   }
   ```

   Add this new route under `Config.Routes` in `Config.lua`. The script will automatically register and use it.

---

## Advanced Features

### **Changing Animations**
Animations for each action are defined in the `client/main.lua`:

- **Gathering:** `"anim@heists@box_carry@"`, `"idle"`
- **Processing:** `"amb@prop_human_bbq@"`, `"base"`
- **Selling:** `"mp_common"`, `"givetake1_a"`

To change these animations:
1. Replace the animation dictionary (`anim@...`) and name (`idle`, `base`, etc.).
2. Use the [Native Trainer Animation List](https://alexguirre.github.io/animations-list/) to find suitable alternatives.

### **Adjusting Action Duration**
In `Config.lua`, modify the `ActionDuration` value (in milliseconds):
```lua
Config.ActionDuration = 5000 -- Action duration in milliseconds
```
For example, to make actions take 10 seconds, set:
```lua
Config.ActionDuration = 10000
```

### **Customizing UI**
- **HTML/CSS:** Edit `html/index.html` and `html/style.css` to change the layout or styling of the UI.
- **JavaScript:** Adjust `html/script.js` to modify the behavior of the UI.

---

## Dependencies
- **ESX Framework:** Ensure your server has ESX installed and properly configured.

---

## Support
If you enjoy this project:
- [Buy Me a Coffee](https://buymeacoffee.com/nxcqu)

---

## Troubleshooting

### Common Issues:
1. **Blips not appearing:**
   - Ensure `fxmanifest.lua` is properly configured and all files are loaded.
   - Check if `Config.Routes` has valid coordinates.

2. **UI not opening:**
   - Verify `ESX.ShowHelpNotification` is working and the player is within range of the location.

3. **Advertisement Block Triggered:**
   - Ensure the `footer#advertisement` exists in `html/index.html`. If removed, the client will block all actions.