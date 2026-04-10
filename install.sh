#!/bin/bash

sudo ./config_file/pacman.conf >/etc/pacman.conf
sh ./nvidia.sh

sudo mkinitcpio -P
