#!/bin/bash

make -p $HOME/.local/share/local_mem
MEM_FILE=$HOME/.local/share/local_mem/chosse_mem_type

if [ ! -f $MEM_FILE ]; then
  echo "ram" >$MEM_FILE
  echo -e "Not found $MEM_FILE\nCreate file type ram"
  exit 0
fi

memory_type=$(cat $MEM_FILE)
if [ $memory_type == "ram" ]; then
  echo "swap" >$MEM_FILE
  polybar-msg action "#memory.hook.1"
  echo "Switch to swap"
  exit 0
fi
echo "ram" >$MEM_FILE
polybar-msg action "#memory.hook.0"
echo "Switch to memory"
