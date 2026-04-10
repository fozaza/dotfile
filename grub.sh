#!/bin/bash

sudo cat ./config_file/grub >/etc/default/grub
sudo cp -r ./config_file/hyperfluent-arch /usr/share/grub/themes/hyperfluent-arch/
sudo mkinitcpio -P
