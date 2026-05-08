#!/bin/bash

mkdir -p ~/.config

cp -r ./i3 ~/.config
cp -r ./polybar/ ~/.config
#cp -r ./bgrunner/ ~/.config
cp -r ./dunst ~/.config
cp -r ./gtk-3.0 ~/.config

./xkb/setup.sh
