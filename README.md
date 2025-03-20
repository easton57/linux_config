# linux_config

Contains configs for hyprland, hyprlock, hyprpaper, kitty, nvim, and waybar.

## Installation

Install hyprland, hyprlock, hyprpaper, grimshot, kitty, nvim and waybar. I use fedora so that'll be with dnf or yum. Change based on your distro.

## Shortcuts

### Hyprland
* SUPER T: Open Terminal
* SUPER Q: Kill Active
* SUPER F: Open File Manager
* SUPER V: Toggle Floating (Gonna get rid of this)
* SUPER SPACE: Exec Menu
* SUPER S: Toggle split
* SUPER B: Open Browser (Brave)
* SUPER R: Grimshot Area
* SUPER W: Grimshot Output

### Hyprland Navigation
These are very similar to vim navigation. Assume SUPER for all
* H: Move focus left
* L: Move focus right
* K: Move focus up
* J: Move focus down
* 1-0: Change workspace (Removed a through z as I won't use them probably)
* SHIFT 1-0: Move selected app to workspace

### User Actions
* SUPER L_CTRL Q: Log out
* SUPER SHIFT Q: Hyprlock

There are others but I don't use them at this time and haven't customized them.


## NVIM

### Navigation
SPACE P V: Open folder navigator

### DAP Debugger
SPACE D R: Open REPL
SPACE D S: Open Stacks
SPACE D W: Open Watches
SPACE D B: Open Breakpoints
SPACE D SHIFT S: Open Scopes
SPACE D C: Open Console
SPACE B: Toggle Breakpoint
SPACE SHIFT B: Set Breakpoint with condiion
F8: Debug continue/launch
F10: Debug Step Over
F11: Debug Step Into
F12: Debug Step Out

### Fugitive (GIT Tools)
SPACE G S: Git info and some diff
SPACE P: Git push
SPACE N: Git pull
SPACE T: Git push -u origin, opts
gu: diffget //2
gh: diffget //3

### LSP
CTRL P: Previous Item
CTRL N: Next Item
CTRL Y: Confirm Item
CTRL SPACE: Complete

### Neotest
SPACE T R: Run test
SPACE T V: Summary Toggle
SPACE T S: Test with suite
SPACE T D: Test with DAP
SPACE T O: Open test output
SPACE T A: Run and open test output

### Telescope
SPACE P F: Search Files
CTRL P: Git Files
SPACE pws and SPACE pWs: Search for words
SPACE P S: Search from command bar
SPACE V H: Help Tags

### Trouble
SPACE T T: Toggle Trouble
SPACE [ T: Next Trouble
SPACE ] T: Previous Trouble

### Undotree
SPACE U: View tree

### Zenmode
SPACE z z: Zenmode width 90
SPACE z Z: Zenmode width 80
