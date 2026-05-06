#!/bin/bash

#dunstify "title" "body"

alert_first=${1:-50}
alert_two=${2:-20}
time=${3:-60}

check_battery_config() {
  num=$1
  std_config=$2
  if [ $num -ge 100 ] || [ $num -le 1 ]; then
    echo $std_config
  else
    echo $num
  fi
}
oalert=$(check_battery_config $alert_first 50)
talert=$(check_battery_config $alert_two 20)

if [ $time -le 0 ]; then
  time=60
fi

battery_life=0
while true; do
  battery_life=$(cat /sys/class/power_supply/BAT0/capacity)
  echo $battery_life

  if [ $battery_life -le $oalert ]; then
    dunstify "Battert alert" "battery low then $oalert" -u normal
  elif [ $battery_life -le $talert ]; then
    dunstify "Battert alert" "battery low then $talert" -u critical
  fi
  sleep $time
done
