#!/bin/bash

pkill polybar
pkill memory_update
pkill read_memory
pkill battery_dunstify_sh
pkill dunstify_routine_sh
pkill battery_charger_duntify_sh.sh
pkill i3wm-dunstify-routine
pkill feh

export LOACL_MEM=$HOME/.local/share/local_mem/

polybar --config=$HOME/.config/polybar/custom/config.ini &
$HOME/.config/i3/script/display/memory_update.sh &
$HOME/.config/i3/script/display/battery_dunstify_sh.sh &
$HOME/.config/i3/script/display/dunstify_routine_sh.sh &
$HOME/.config/i3/script/display/battery_charger_duntify_sh.sh &
$HOME/.config/i3/script/display/i3wm-dunstify-routine &
$HOME/.config/bgrunner/runner.sh &
$HOME/.config/i3/script/display/read_memory -t1 &
