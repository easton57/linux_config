#!/bin/bash

APP="$@"

# Get the monitor of the currently focused window
MONITOR=$(hyprctl activeworkspace -j | jq -r '.monitor')

# You can also use `hyprctl activeworkspace -j` to get the active workspace's monitor if you prefer

# Set GDK_SCALE based on monitor
case "$MONITOR" in
  eDP-1)
    export GDK_SCALE=2
    ;;
  *)
    export GDK_SCALE=1
    ;;
esac

# Launch the app
exec $APP

