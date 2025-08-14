#!/bin/bash

echo "Installing the theme..."
yay -S --noconfirm papirus-icon-theme
git clone https://github.com/Fausto-Korpsvart/Tokyonight-GTK-Theme
cd Tokyonight-GTK-Theme/themes/
./install.sh
cd ~
rm -rf Tokyonight-GTK-Theme

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'
gsettings set org.gnome.desktop.interface gtk-theme 'Tokyonight-Dark'

BACKGROUND_ORG_PATH="$HOME/.local/share/jfranciscosousa-arch-setup/assets/background.jpg"
BACKGROUND_DEST_DIR="$HOME/.local/share/backgrounds"
BACKGROUND_DEST_PATH="$BACKGROUND_DEST_DIR/background.jpg"

if [ ! -d "$BACKGROUND_DEST_DIR" ]; then mkdir -p "$BACKGROUND_DEST_DIR"; fi

[ ! -f $BACKGROUND_DEST_PATH ] && cp $BACKGROUND_ORG_PATH $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-uri-dark $BACKGROUND_DEST_PATH
gsettings set org.gnome.desktop.background picture-options 'zoom'

# More gnome settings

# Center new windows in the middle of the screen
gsettings set org.gnome.mutter center-new-windows true
# Reveal week numbers in the Gnome calendar
gsettings set org.gnome.desktop.calendar show-weekdate true
# Turn off ambient sensors for setting screen brightness (they rarely work well!)
gsettings set org.gnome.settings-daemon.plugins.power ambient-enabled false
# Set Cascadia Mono as the default monospace font
gsettings set org.gnome.desktop.interface monospace-font-name 'CaskaydiaMono Nerd Font 10'
# Enable VRR
gsettings set org.gnome.mutter experimental-features "['variable-refresh-rate']"
