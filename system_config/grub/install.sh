#!/bin/bash

sudo cat ./grub >/etc/default/grub
cp -r ./minegrub-world-selection/ /boot/grub/themes
sudo grub-mkconfig -o /boot/grub/grub.cfg
