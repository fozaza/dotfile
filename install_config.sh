#!/bin/bash

mkdir -p ~/.config

cp -r ./i3 ~/.config
cp -r ./polybar/ ~/.config
cp -r ./rofi/ ~/.config
cp -r ./dunst ~/.config
cp -r ./gtk-3.0 ~/.config
cp -r ./redshift/ ~/.config

./xkb/setup.sh
