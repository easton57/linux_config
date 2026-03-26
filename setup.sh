# Add COPR
sudo dnf copr enable scottames/ghostty
sudo dnf copr enable hermitfeather/hyprland
sudo dnf copr enable erikreider/swayosd

# Add repo's for steam
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

# Install packages
sudo dnf install hyprland hypridle hyprpaper wofi neovim nm-applet blueman-applet ghostty \
    waybar hyprlauncher dunst grimshot steam zsh fastfetch btop swayosd kf6-kwallet -y

# Install Brave
curl -fsS https://dl.brave.com/install.sh | sh

# Install Zed
curl -f https://zed.dev/install.sh | sh

# Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Spotify and 3D Printer
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.spotify.Client
flatpak install flathub com.discordapp.Discord
flatpak install flathub im.riot.Riot

wget https://github.com/OrcaSlicer/OrcaSlicer/releases/download/v2.3.1/OrcaSlicer-Linux-flatpak_V2.3.1_x86_64.flatpak
flatpak install OrcaSlicer-Linux-flatpak_V2.3.1_x86_64.flatpak

# ZSH config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Enable hypridle
systemctl enable --user --now hypr/hypridle.service

# sway osd backend
sudo systemctl enable --now swayosd-libinput-backend.service

# pywal
pip install pywal

# symlinks
