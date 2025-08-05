#!/bin/bash

# GPU Toggle Script for Fedora with Hyprland
# This script toggles between integrated and NVIDIA graphics

SCRIPT_DIR="$HOME/.config/waybar/scripts"
STATE_FILE="$SCRIPT_DIR/gpu_state"
GRUB_CONFIG="/etc/default/grub"

# Create config directory if it doesn't exist
mkdir -p "$SCRIPT_DIR"

# Function to get current GPU state
get_gpu_state() {
    if [ -f "$STATE_FILE" ]; then
        cat "$STATE_FILE"
    else
        # Default to nvidia if state file doesn't exist
        echo "nvidia"
    fi
}

# Function to check if nvidia modules are loaded
is_nvidia_loaded() {
    lsmod | grep -q "^nvidia"
}

# Function to check current active driver
get_active_driver() {
    # Check what driver is actually being used for rendering
    if command -v nvidia-smi &> /dev/null && nvidia-smi &> /dev/null; then
        echo "nvidia"
    elif lspci -k | grep -A 2 -E "(VGA|3D)" | grep -q "nvidia"; then
        echo "nvidia"
    elif lspci -k | grep -A 2 -E "(VGA|3D)" | grep -q "i915"; then
        echo "integrated"
    else
        echo "unknown"
    fi
}

# Function to update grub configuration
update_grub_config() {
    local mode=$1
    
    # Backup original grub config
    sudo cp "$GRUB_CONFIG" "$GRUB_CONFIG.backup"
    
    # Remove existing modprobe parameters
    sudo sed -i 's/modprobe\.blacklist=[^ ]* //g' "$GRUB_CONFIG"
    sudo sed -i 's/nouveau\.modeset=[^ ]* //g' "$GRUB_CONFIG"
    sudo sed -i 's/nvidia-drm\.modeset=[^ ]* //g' "$GRUB_CONFIG"
    
    if [ "$mode" = "integrated" ]; then
        # Blacklist nvidia modules, enable nouveau and integrated graphics
        sudo sed -i 's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="modprobe.blacklist=nvidia,nvidia_drm,nvidia_modeset,nvidia_uvm nouveau.modeset=1 /' "$GRUB_CONFIG"
        echo "integrated" > "$STATE_FILE"
    else
        # Enable nvidia, disable nouveau modeset (keep nouveau loaded but not active)
        sudo sed -i 's/GRUB_CMDLINE_LINUX="/GRUB_CMDLINE_LINUX="nouveau.modeset=0 nvidia-drm.modeset=1 /' "$GRUB_CONFIG"
        echo "nvidia" > "$STATE_FILE"
    fi
    
    # Update grub
    sudo grub2-mkconfig -o /boot/grub2/grub.cfg
}

# Function to show current status
show_status() {
    local current_state=$(get_gpu_state)
    local nvidia_loaded=$(is_nvidia_loaded && echo "yes" || echo "no")
    local active_driver=$(get_active_driver)
    
    echo "Current GPU State: $current_state"
    echo "NVIDIA modules loaded: $nvidia_loaded"
    echo "Active driver: $active_driver"
    
    if [ "$current_state" = "nvidia" ] && [ "$active_driver" = "nvidia" ]; then
        echo "Status: NVIDIA GPU active"
    elif [ "$current_state" = "integrated" ] && [ "$active_driver" = "integrated" ]; then
        echo "Status: Integrated GPU active"
    else
        echo "Status: Configuration mismatch - reboot may be required"
    fi
    
    # Show additional info
    echo ""
    echo "Loaded graphics modules:"
    lsmod | grep -E "(nvidia|nouveau|i915)" | awk '{print "  " $1}'
    
    echo ""
    echo "GPU hardware detected:"
    lspci | grep -E "(VGA|3D)" | sed 's/^/  /'
}

# Function to toggle GPU
toggle_gpu() {
    local current_state=$(get_gpu_state)
    
    if [ "$current_state" = "nvidia" ]; then
        echo "Switching to integrated graphics..."
        update_grub_config "integrated"
        echo "Switched to integrated graphics. Reboot required."
    else
        echo "Switching to NVIDIA graphics..."
        update_grub_config "nvidia"
        echo "Switched to NVIDIA graphics. Reboot required."
    fi
}

# Function to get icon for waybar
get_icon() {
    local current_state=$(get_gpu_state)
    local active_driver=$(get_active_driver)
    
    if [ "$current_state" = "nvidia" ] && [ "$active_driver" = "nvidia" ]; then
        echo "󰢮"  # NVIDIA active
    elif [ "$current_state" = "integrated" ] && [ "$active_driver" = "integrated" ]; then
        echo "󰇄"  # Integrated active
    else
        echo "󰚥"  # Needs reboot
    fi
}

# Function to get tooltip text
get_tooltip() {
    local current_state=$(get_gpu_state)
    local active_driver=$(get_active_driver)
    
    if [ "$current_state" = "nvidia" ] && [ "$active_driver" = "nvidia" ]; then
        echo "NVIDIA GPU Active (High Performance)"
    elif [ "$current_state" = "integrated" ] && [ "$active_driver" = "integrated" ]; then
        echo "Integrated GPU Active (Power Saving)"
    else
        echo "GPU Switch Pending - Reboot Required"
    fi
}

# Function to get waybar output
waybar_output() {
    local icon=$(get_icon)
    local tooltip=$(get_tooltip)
    local current_state=$(get_gpu_state)
    local active_driver=$(get_active_driver)
    
    # Color coding: red for nvidia, green for integrated, yellow for pending
    local class=""
    if [ "$current_state" = "nvidia" ] && [ "$active_driver" = "nvidia" ]; then
        class="nvidia"
    elif [ "$current_state" = "integrated" ] && [ "$active_driver" = "integrated" ]; then
        class="integrated"
    else
        class="pending"
    fi
    
    echo "{\"text\":\"$icon\",\"tooltip\":\"$tooltip\",\"class\":\"$class\"}"
}

# Main script logic
case "$1" in
    "status")
        show_status
        ;;
    "toggle")
        toggle_gpu
        ;;
    "waybar")
        waybar_output
        ;;
    "icon")
        get_icon
        ;;
    "tooltip")
        get_tooltip
        ;;
    *)
        echo "Usage: $0 {status|toggle|waybar|icon|tooltip}"
        echo ""
        echo "Commands:"
        echo "  status  - Show current GPU status"
        echo "  toggle  - Toggle between integrated and NVIDIA GPU"
        echo "  waybar  - Output JSON for waybar module"
        echo "  icon    - Get current icon"
        echo "  tooltip - Get current tooltip text"
        exit 1
        ;;
esac
