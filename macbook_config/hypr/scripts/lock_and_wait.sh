#!/bin/bash

# Lock the screen
hyprlock &

# Run a keypress check in the background
read -t 30 -n 1 key
if [ $? -ne 0 ]; then
    # No key was pressed within 30 seconds
    systemctl suspend
fi

