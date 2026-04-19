#!/bin/bash

# pkill loop_test.sh
data=1
while true; do
  echo $data
  ((data++))
done

# while true; do
#   cat ~/.local/share/local_mem/memory
#   sleep 1
# done
