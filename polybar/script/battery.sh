#!/bin/bash

capacity_amin=(󰁺 󰁼 󰁾 󰂀 󰁹)
battey_list=(10 20 50 75 90)
capacity=""
capacity_show=""
charging=""

while true; do
  battery_life=$(cat /sys/class/power_supply/BAT0/capacity)
  battery_charging=$(cat /sys/class/power_supply/BAT0/status)

  for i in "${!capacity_amin[@]}"; do
    if [ $battery_life -ge "${battey_list[$i]}" ]; then
      capacity="${capacity_amin[$i]}"
    fi
  done

  if [ "$battery_charging" == "Discharging" ]; then
    charging=""
  else
    charging="󱐋:"
    # if [ "$capacity_show" == "" ]; then
    #   capacity_show="${capacity_amin[0]}"
    #   echo $charging$capacity_show $battery_life%
    #   sleep 2
    #   continue
    # fi
    #
    # for i in "${capacity_amin[@]}"; do
    #   if [ "${capacity_amin[$i]}" == $capacity_show ]; then
    #     if [ $i == "${!capacity_amin[@]}" ]; then
    #       capacity_show="${capacity_show[0]}"
    #     fi
    #     capacity_show="${capacity_show[$((i + 1))]}"
    #   fi
    # done
    # echo $charging$capacity_show $battery_life%
    # sleep 2
    # continue
  fi

  echo $charging$capacity $battery_life%
  sleep 2
done
