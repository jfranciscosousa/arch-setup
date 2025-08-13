#!/bin/bash

echo "Installing appimagelauncher and flatpak..."
yay -S --noconfirm appimagelauncher flatpak

echo "Installing beeper..."
wget https://api.beeper.com/desktop/download/linux/x64/stable/com.automattic.beeper.desktop
ail-cli integrate com.automattic.beeper.desktop
rm -rf com.automattic.beeper.desktop

echo "Installing 1password..."
curl -sS https://downloads.1password.com/linux/keys/1password.asc | gpg --import
yay -S --noconfirm 1password 1password-cli

echo "Installing vscode..."
yay -S --noconfirm visual-studio-code-bin

echo "Installing discord..."
flatpak install -y --noninteractive org.freedesktop.Platform/x86_64/24.08
flatpak install -y --noninteractive flathub com.discordapp.Discord

echo "Installing lutris, steam, and gaming stuff"
sudo pacman -S --noconfirm nvidia-open-dkms cachyos-gaming-meta cachyos-gaming-applications cachyos/umu-launcher

echo "Installing zen browser..."
flatpak install -y --noninteractive flathub app.zen_browser.zen

echo "Installing pinta..."
flatpak install -y --noninteractive flathub com.github.PintaProject.Pinta

echo "Installing spotify..."
sudo pacman -S --noconfirm spotify-launcher

echo "Installing celluloid..."
sudo pacman -S --noconfirm celluloid
