#!/bin/bash

pre_minute=$(date +"%M")
sleep_time=0

if [ $pre_minute -ge 0 ] && [ $pre_minute -le 29 ]; then
  sleep_time=$((29 - pre_minute))
elif [ $pre_minute -ge 30 ] && [ $pre_minute -le 59 ]; then
  sleep_time=$((59 - pre_minute))

else
  sleep_time=$pre_minute
fi
echo $sleep_time

task1_hour=22
task1_minute=00
task1_alert_msg="time to sleep"
task1_alert_type="critical"
####
# test_task1_hour=22
# test_task1_minute=00
# if [ $task1_hour == $test_task1_hour ] && [ $test_task1_minute == $task1_minute ]; then
#   echo true
# fi
task2_hour=21
task2_minute=30
task2_alert_msg="more 30 minute go to sleep"
task2_alert_type="normal"

while true; do
  hour=$(date +"%H")
  minute=$(date +"%M")

  if [ $task1_hour == $hour ] && [ $task1_minute == $minute ]; then
    dunstify "Routine msg" $task1_alert_msg -u $task1_alert_type
  elif [ $task2_hour == $hour ] && [ $task2_minute == $minute ]; then
    dunstify "Routine msg" $task2_alert_msg -u $task2_alert_type
  fi

  sleep $((sleep_time * 60))
  sleep_time=30
done
