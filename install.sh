#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Disable lock screen
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

source ~/.local/share/jfranciscosousa-arch-setup/scripts/gnome-extensions.sh
source ~/.local/share/jfranciscosousa-arch-setup/scripts/base.sh
source ~/.local/share/jfranciscosousa-arch-setup/scripts/terminal.sh
source ~/.local/share/jfranciscosousa-arch-setup/scripts/desktop.sh
source ~/.local/share/jfranciscosousa-arch-setup/scripts/dock.sh
source ~/.local/share/jfranciscosousa-arch-setup/scripts/fonts.sh
source ~/.local/share/jfranciscosousa-arch-setup/scripts/theme.sh
source ~/.local/share/jfranciscosousa-arch-setup/scripts/remove-packages.sh

# Enable lock screen again
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

echo "Everything's ready!"

zsh
