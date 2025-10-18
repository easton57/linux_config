#!/usr/bin/env bash

displays() {
  if [ "$1" = "monitoradded>>DP-1" ]; then
    hyprctl keyword monitor "eDP-1,disable"
    hyprctl keyword monitor "DP-1,2560x1440@165,auto,1"
  elif [ "$1" = "monitorremoved>>DP-1" ]; then
    hyprctl keyword monitor "eDP-1,preferred,auto,1.333333"
    hyprctl keyword monitor "DP-1,preferred,auto,1"
  fi
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do displays "$line" && sleep 0.1; done
