#!/bin/bash

# First things first
sudo pacman -S --noconfirm git go

# Install Rust using pacman
sudo pacman -S --noconfirm rustup

# Prompt user to choose Rust version with an 8-second timeout
echo "Select default Rust version using 'rustup default <version>' (e.g., stable, nightly)"
read -t 8 -p "Enter Rust version (timeout in 8 seconds): " rust_version
rustup default "$rust_version" || { echo "Failed to set default Rust version"; exit 1; }

# Install yay
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

# Install other packages with yay
yay -S --noconfirm autoconf autoconf-archive automake base-devel multilib-devel \
  wlroots wayland wayland-utils wayland-protocols gdb ninja gcc cmake meson \
  libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite \
  xorg-xinput libxrender pixman wayland-protocols cairo pango seatd \
  libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info \
  cpio npm jo jq tomlplusplus clang gcc qt5-wayland qt6-wayland xdg-desktop-portal \
  xdg-desktop-portal-gtk xdg-desktop-portal-wlr nodejs xdg-desktop-portal-hyprland \
  pipewire wireplumber dunst python python-pywal strawberry brightnessctl bluez \
  bluez-libs rofi-lbonn-wayland-git networkmanager network-manager-applet wofi \
  qt5-gsettings ffmpegthumbs playerctl lightly-qt kvantum polkit-kde-agent \
  ttf-font-awesome-5 jq gufw qt5ct tar gammastep wl-clipboard nwg-look-bin \
  thunderbird visual-studio-code-bin firefox easyeffects mako hyprpicker \
  hyprshot-git bc sysstat kitty alacritty sassc zip unzip systemsettings \
  ttf-font-awesome-5 orchis-theme-git acpi fish nwg-look blueman lightly-qt \
  firefox mpc mpd vlc mpv celluloid geany geany-plugins notepadqq \
  nm-connection-editor glib2 gtk3 deadd-notification-center-bin cava thunar \
  ffmpeg thunar-volman thunar-archive-plugin gvfs ranger swww cliphist copyq \
  spotify spotify-adblock-git spotify-wayland tumbler hyprland-git \
  aylurs-gtk-shell eww-wayland zenity aalib jp2a ascii i2pd lsd thefuck \
  archinstall shell-color-scripts udisks2 udiskie aurutils pavucontrol \
  xdg-user-dirs pacman-contrib reflector archlinux-themes-sddm

# Continue with the rest of the script...

# Update user dirs
xdg-user-dirs-update

# Start paccache.timer
sudo systemctl enable paccache.timer

# Enable sddm
sudo systemctl enable sddm

# Update Arch and reboot
sudo pacman -Syu --noconfirm && reboot
