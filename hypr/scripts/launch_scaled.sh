#!/bin/bash

APP="$@"

# Get the monitor of the currently focused window
MONITOR=$(hyprctl activeworkspace -j | jq -r '.monitor')

# You can also use `hyprctl activeworkspace -j` to get the active workspace's monitor if you prefer

# Set GDK_SCALE based on monitor
case "$MONITOR" in
  eDP-1)
    export GDK_SCALE=1
    ;;
  *)
    export GDK_SCALE=1
    ;;
esac

echo "Launching: $APP"

# Launch the app
# Chromium based
if [[ "$APP" == "brave-browser" ]] || [[ "$APP" == "steam" ]]; then 
    echo "Chromium based app"
    $APP --enable-features=VaapiVideoDecodeLinuxGL --use-gl=angle --use-angle=gl --ozone-platform=wayland
# Electron based
elif [[ "$APP" == "legcord" ]]; then 
    echo "Electron based app"
    $APP -enable-features=UseOzonePlatform,WaylandWindowDecorations --ozone-platform-hint=wayland
else
    echo "No rules applied"
    exec $APP
fi

