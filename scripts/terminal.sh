#!/bin/bash

echo "Installing terminal tools..."
echo "Installing zsh..."
sudo pacman -S --noconfirm zsh >/dev/null

echo "Installing zgen..."
rm -rf "${HOME}/.zgen"
git clone https://github.com/tarjoilija/zgen.git "${HOME}/.zgen" >/dev/null

echo "Installing asdf..."
yay -S --noconfirm asdf-vm
asdf plugin add nodejs
asdf plugin add pnpm
asdf plugin add deno
asdf plugin add ruby
asdf plugin add erlang
asdf plugin add elixir

echo "Installing nodejs..."
asdf install nodejs latest
echo "Installing pnpm..."
asdf install pnpm latest
echo "Installing deno..."
asdf install deno latest
echo "Installing ruby..."
asdf install ruby latest
echo "Installing erlang..."
asdf install erlang latest
echo "Installing elixir..."
asdf install elixir 1.18.4

asdf set -u nodejs latest
asdf set -u pnpm latest
asdf set -u deno latest
asdf set -u ruby latest
asdf set -u erlang latest
asdf set -u elixir 1.18.4

echo "Installing postgresql..."
sudo pacman -S --noconfirm postgresql
sudo -u postgres rm -rf /var/lib/postgres/data
sudo -u postgres mkdir /var/lib/postgres/data
sudo -u postgres initdb --locale=C.UTF-8 --encoding=UTF8 -D /var/lib/postgres/data --data-checksums
sudo systemctl start postgresql.service
sudo -u postgres createuser $USER --no-password --superuser
createdb $USER
