#!/bin/bash

pkill polybar
pkill memory_update
pkill read_memory

export LOACL_MEM=$HOME/.local/share/local_mem/

polybar --config=$HOME/.config/polybar/custom/config.ini &
$HOME/.config/i3/script/display/memory_update.sh &
$HOME/.config/i3/script/display/read_memory -t1
