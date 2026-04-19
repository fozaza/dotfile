#!/bin/bash

sudo pacman -Syu &
sudo pacman -S git neovim

cd $HOME &
git clone https://aur.archlinux.org/yay.git &
cd yay &
makepkg -si &
cd $HOME &
rm -rf yay

yay -Syu
yay -S i3 rofi kitty xkb-switch
