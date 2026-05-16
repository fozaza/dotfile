#!/bin/bash

time=30
capacity_1=󰁺
capacity_2=󰁼
capacity_3=󰁾
capacity_4=󰂀
capacity_5=󰁹
capacity=""
charging=""

while true; do
  battery_life=$(cat /sys/class/power_supply/BAT0/capacity)
  battery_charging=$(cat /sys/class/power_supply/BAT0/status)

  if [ $battery_life -ge 90 ]; then
    capacity=$capacity_5
  elif [ $battery_life -ge 75 ]; then
    capacity=$capacity_4
  elif [ $battery_life -ge 50 ]; then
    capacity=$capacity_3
  elif [ $battery_life -ge 20 ]; then
    capacity=$capacity_2
  elif [ $battery_life -ge 10 ]; then
    capacity=$capacity_1
  fi

  if [ "$battery_charging" == "Discharging" ]; then
    charging=""
  else
    charging="󱐋"
  fi
  echo $charging:$capacity $battery_life%
  sleep 5
done
