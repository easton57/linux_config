#!/bin/bash

# Volume adjustment increment
VOLUME_INCREMENT=5

# Increase volume
if [[ $1 == "up" ]]; then
    pamixer --increase $VOLUME_INCREMENT
fi

# Decrease volume
if [[ $1 == "down" ]]; then
    pamixer --decrease $VOLUME_INCREMENT
fi

# Mute/unmute
if [[ $1 == "mute" ]]; then
    pamixer --toggle-mute
fi

# Get current volume
VOLUME=$(pamixer --get-volume-human)
if pamixer --get-mute; then
    VOLUME="Muted"
fi

# Get the volume
VOLUME=$(pamixer --get-volume-human)

# Display notification
notify-send "Volume" "$VOLUME"

