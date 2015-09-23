#!/bin/bash

# Switch header pin:
PIN=7

# Required button hold down seconds
HOLDTIME=6

# Wait with interrupt for falling edge of pin 0 (RPi pin 11)
# Then poll the pin until it goes high. It elapsed time
# low is more than 6 seconds halt processor otherwise
# fall back into interrupt mode waiting for falling edge
# Adapted from http://crompton.com/hamradio/RPi2_halt_switch/

# Take pin from command line or use default
# Default pin 0 (wiringpi layout) (RPi pin 11)
#if [ -z "$1" ]
#  then
#    PIN=7
#  else
#    PIN=$1
#fi

ps ax | grep "[g]pio wfi $PIN falling" > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is already running."
  exit 0
fi

gpio mode $PIN in
gpio mode $PIN up
TIME1=1

while [ 1=1 ]
#echo "got here 1"
   gpio wfi $PIN falling
   do
#echo "got here 2"
   echo "Button pressed. Counting..."
   while [ `gpio read $PIN` -eq "0" ];
   do
#echo $TIME1 $STATE
      sleep 1
      let TIME1+=1
      if [ $TIME1 -gt $HOLDTIME ]; then
         break 3;
      fi
   done
   TIME1=1
   continue
done
# Call code here to execute before shutdown
echo "Button held, shutting down."
sleep 5
/usr/bin/systemctl poweroff --message="Shutdown initiated by GPIO interrupt."
