#!/bin/bash

echo "=> This script is for fresh CachyOS installations with Gnome only!"

echo "Cloning install script..."

rm -rf ~/.local/share/jfranciscosousa-arch-setup
git clone https://github.com/jfranciscosousa/arch-setup.git ~/.local/share/jfranciscosousa-arch-setup

echo "Installation starting..."
echo "source ~/.local/share/jfranciscosousa-arch-setup/install.sh" | bash