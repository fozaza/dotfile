#!/bin/bash

sudo pacman -Syu
sudo pacman -S base-devel linux-headers git nano --needed

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

yay -S nvidia-dkms nvidia-utils lib32-nvidia-utils

sudo cat ./config_file/mkinitcpio.conf >/etc/mkinitcpio.conf
