#!/bin/bash

mkdir -p ~/.config

cp -r ./i3 ~/.config
cp -r ./polybar/ ~/.config
cp -r ./bgrunner/ ~/.config

./xkb/setup.sh
