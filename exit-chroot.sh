#!/bin/sh
if grep -qs '/sys' /proc/mounts
then umount -l /sys
fi

if grep -qs '/dev' /proc/mounts
then umount -l /dev
fi

if grep -qs '/proc' /proc/mounts
then umount -l /proc 
fi

# Signal that the unmounting process is complete by writing to the named pipe
echo exit > /exit.fifo
