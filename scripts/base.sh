#!/bin/bash

echo "Installing zsh..."
sudo pacman -S --noconfirm zsh
sudo chsh -s $(which zsh) $(whoami)

echo "You can now sit back and enjoy..."

echo "Installing base development packages..."
sudo pacman -S --noconfirm base-devel

echo "Installing yay..."
sudo pacman -S --noconfirm yay

echo "Getting rid of fish..."
sudo pacman -Runs --noconfirm fish || true
