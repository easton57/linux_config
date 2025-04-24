# linux_config

Contains configs for hyprland, hyprlock, hyprpaper, kitty, nvim, and waybar.

## Installation

Install the following

* hyprland
* hyprlock
* hyprpaper
* grimshot
* kitty
* nvim
* dunst
* tmux 
* nm-applet 
* waybar 
* pamixer
* libnotify
* avizo
* zsh (oh my zsh)

Other resources that are needed

* valac
* cargo
* golang
* cmake
* rust-glib+compiletests-devel
* sassc
* qt5ct
* qt6ct
* kvantum-qt5
* kvantum-qt6
* lxappearance

For unimformity add the following lines to /etc/environment

QT_QPA_PLATFORMTHEME=qt5ct
QT_QPA_PLATFORMTHEME_QT6=qt6ct
QT_STYLE_OVERRIDE=kvantum

I use fedora so that'll be with dnf or yum. Change based on your distro.

You can either move these config files to the .config directory or do what I do and make a symlink using ln so I can keep these in a clean git directory where I can upload changes.

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
* SPACE P V: Open folder navigator

### DAP Debugger
* SPACE D R: Open REPL
* SPACE D S: Open Stacks
* SPACE D W: Open Watches
* SPACE D B: Open Breakpoints
* SPACE D SHIFT S: Open Scopes
* SPACE D C: Open Console
* SPACE B: Toggle Breakpoint
* SPACE SHIFT B: Set Breakpoint with condiion
* F8: Debug continue/launch
* F10: Debug Step Over
* F11: Debug Step Into
* F12: Debug Step Out

### Fugitive (GIT Tools)
* SPACE G S: Git info and some diff
* SPACE P: Git push
* SPACE N: Git pull
* SPACE T: Git push -u origin, opts
* gu: diffget //2
* gh: diffget //3

### LSP
* CTRL P: Previous Item
* CTRL N: Next Item
* CTRL Y: Confirm Item
* CTRL SPACE: Complete

### Neotest
* SPACE T R: Run test
* SPACE T V: Summary Toggle
* SPACE T S: Test with suite
* SPACE T D: Test with DAP
* SPACE T O: Open test output
* SPACE T A: Run and open test output

### Telescope
* SPACE P F: Search Files
* CTRL P: Git Files
* SPACE pws and SPACE pWs: Search for words
* SPACE P S: Search from command bar
* SPACE V H: Help Tags

### Trouble
* SPACE X X: Toggle Trouble

### Undotree
* SPACE U: View tree

### Zenmode
* SPACE z z: Zenmode width 90
* SPACE z Z: Zenmode width 80

### LLM-LS
* TAB: Autofill
* S TAB: Ignore (I think)
