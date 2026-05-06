#!/bin/bash

pkill polybar
pkill memory_update
pkill read_memory
pkill battery_dunstify_sh
pkill dunstify_routine_sh
pkill feh

export LOACL_MEM=$HOME/.local/share/local_mem/

polybar --config=$HOME/.config/polybar/custom/config.ini &
$HOME/.config/i3/script/display/memory_update.sh &
$HOME/.config/i3/script/display/battery_dunstify_sh.sh &
$HOME/.config/i3/script/display/dunstify_routine_sh.sh &
$HOME/.config/bgrunner/bgChosse
$HOME/.config/i3/script/display/read_memory -t1 &
