#!/bin/bash

make -p $HOME/.local/share/local_mem
MEM_FILE=$HOME/.local/share/local_mem/chosse_mem_type
COOLDOWN=1 # 1s.

if [ ! -f $MEM_FILE ]; then
  echo "ram" >$MEM_FILE
fi

while true; do
  sleep $COOLDOWN
  type_memory=$(cat $MEM_FILE)
  if [ $type_memory == "ram" ]; then
    polybar-msg action "#memory.hook.0"
    continue
  fi
  polybar-msg action "#memory.hook.1"
done

# read_last_set() {
#   if [ ! -f $MEM_FILE ]; then
#     echo "ram" >$MEM_FILE
#     echo "ram"
#     return
#   fi
#
#   current=$(cat $MEM_FILE)
#   if [ $current == "ram" ]; then
#     echo "swap" >$MEM_FILE
#     echo "swap"
#   else
#     echo "ram" >$MEM_FILE
#     echo "ram"
#   fi
# }
#
# type_memory=$(read_last_set)
#
# if [ $type_memory == "ram" ]; then
#   while true; do
#     polybar-msg action "#memory.hook.0" 2>$HOME/.config/polybar/custom/log.text
#     sleep 1
#   done
# else
#   while true; do
#     polybar-msg action "#memory.hook.1" 2>$HOME/.config/polybar/custom/log.text
#     sleep 1
#   done
# fi
