#!/bin/bash

sudo pacman -Syu &
sudo pacman -S git neovim curl
# install LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install bgtui
git clone https://github.com/fozaza/bgtui.git
cd bgtui
ctltool.sh i
ctltool.sh ib
cd ..

# install i3wm-config-builder
# git clone https://github.com/fozaza/i3wm-config-builder.git
# cd i3wm-config-builder
# sh install.sh
# cd ..

cd $HOME &
git clone https://aur.archlinux.org/yay.git &
cd yay &
makepkg -si &
cd $HOME &
rm -rf yay

yay -Syu
yay -S i3 rofi kitty xkb-switch thunar gvfs dunst fish nodejs redshift --needed

chsh -s /bin/fish
sudo chsh -s /bin/fish
