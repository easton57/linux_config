#!/bin/bash

# Prompt the user for a program to run
APP=$(wofi --show drun --prompt "Launch:" --insensitive)
echo "App Name: $APP"
# If nothing was selected, exit
[ -z "$APP" ] && exit

# Run it with scaling logic
~/.config/hypr/scripts/launch_scaled.sh "$APP"

