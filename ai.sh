#!/bin/bash

# Set up NVMe and HDD partitioning
echo -e "o\nY\nn\n\n\n+512M\nEF00\nn\n\n\n\n8300\nw\nY" | gdisk /dev/nvme0n1
echo -e "o\nY\nn\n\n\n\n8300\nw\nY" | gdisk /dev/sda

# Format partitions
mkfs.fat -F32 /dev/nvme0n1p1
mkfs.ext4 /dev/sda1

# Mount partitions
mount /dev/sda1 /mnt
mkdir -p /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot

# Install base system
pacstrap /mnt base base-devel

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the new system
arch-chroot /mnt /bin/bash <<EOF
# Set the time zone 
ln -sf /usr/share/zoneinfo/America/Denver /etc/localtime
hwclock --systohc

# Set the locale
echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf

# Set the hostname
echo "YourHostname" > /etc/hostname
echo -e "127.0.0.1\tlocalhost\n::1\t\tlocalhost\n127.0.1.1\tYourHostname.localdomain\tYourHostname" >> /etc/hosts

# Install necessary packages
pacman -S --noconfirm networkmanager grub efibootmgr sudo

# Configure GRUB
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

# Enable NetworkManager
systemctl enable NetworkManager

# Set up home directory on the NVMe drive
useradd -m -G wheel -s /bin/bash your_username
passwd your_username

# Allow wheel group to execute any command with sudo
echo '%wheel ALL=(ALL) ALL' | EDITOR='tee -a' visudo

# Install additional packages
pacman -S --noconfirm git go rustup
echo "Select default Rust version using 'rustup default <version>' (e.g., stable, nightly)"
read -t 8 -p "Enter Rust version (timeout in 8 seconds): " rust_version
rustup default "$rust_version" || { echo "Failed to set default Rust version"; exit 1; }

# Install yay
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install other packages with yay (paste the list from your original script here)

# Update user dirs
xdg-user-dirs-update

# Start paccache.timer
sudo systemctl enable paccache.timer

# Clone git repo
git clone https://github.com/l1nux-th1ngz/colors.git

# Files
mv ~/.config/hypr/ ~/.config/hypr-old
mv ~/.config/ags/ ~/.config/ags-old
mv ~/.config/wofi/ ~/.config/wofi-old
cp ~/.config/fish/config.fish ~/.config/fish/config.back.fish
cp -r .config/zathura ~/.config/
cp -r .config/deadd ~/.config/
cp -r .config/mako ~/.config/
cp -r .config/cava ~/.config/
cp -r .config/kitty ~/.config/
cp -r .config/rofi ~/.config
cp -r .config/dunst ~/.config
cp -r .config/eww ~/.config
cp -r .config/swww ~/.config

# Copy files
cp -r my-hyprland-config ~/.config/hypr
cp -r ~/.config/hypr/configs/ags ~/.config/ags
cp -r ~/.config/hypr/configs/wofi ~/.config/wofi
cp ~/.config/hypr/configs/config.fish ~/.config/fish/config.fish

# Set permissions for scripts
sudo chmod +x ~/.config/hypr/scripts/*
sudo chmod +x ~/.config/ags/scripts/*

# Setup environment
sudo cp /etc/environment /etc/environmentOLD
echo 'QT_QPA_PLATFORMTHEME=qt5ct' | sudo tee -a /etc/environment

# Copy theme files
mkdir -p ~/.local/share/color-schemes/
cp ~/.config/ags/modules/theme/plasma-colors/* ~/.local/share/color-schemes/
cp ~/.config/hypr/configs/qt5ct.conf ~/.config/qt5ct/

mkdir -p ~/.fonts
cp -r ~/.config/hypr/configs/.fonts/* ~/.fonts

mkdir -p ~/.local/share/icons
tar xvf ~/.config/hypr/configs/icons/*.tar.gz -C ~/.local/share/icons

mkdir -p ~/.themes
tar xvf ~/.config/hypr/configs/gtk-themes/*.tar.gz -C ~/.themes

# Install plymouth
yay -S --noconfirm plymouth-theme-sweet-arch-git

# Enable plymouth
sudo plymouth-set-default-theme -R sweet-arch

# Clone, install, and enable sddm
git clone https://github.com/stuomas/delicious-sddm-theme.git
cd delicious-sddm-theme
chmod +x ./install.sh

# Enable sddm
sudo systemctl enable sddm

# Update Arch and reboot
sudo pacman -Syu --noconfirm && reboot
EOF
