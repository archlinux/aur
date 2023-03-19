#!/bin/sh
if [ $USER != 'root' ]; then
  echo "This script needs root access"
  exit 1
fi

# Mount resources
MOUNT_POINT=/usr/share/alpine-minirootfs

if ! grep -qs "$MOUNT_POINT/sys" /proc/mounts
then mount --rbind /sys $MOUNT_POINT/sys   || exit 1
fi

if ! grep -qs "$MOUNT_POINT/dev" /proc/mounts
then
    mount --rbind /dev $MOUNT_POINT/dev   || exit 1
    mount --make-rslave $MOUNT_POINT/dev  || exit 1
fi

if ! grep -qs "$MOUNT_POINT/proc" /proc/mounts
then mount -t proc /proc $MOUNT_POINT/proc || exit 1
fi

# chroot exit signal pipe
if [ ! -e $MOUNT_POINT/exit.fifo ]
then mkfifo $MOUNT_POINT/exit.fifo
fi

# Function to monitor the named pipe for the exit signal from the internal script
monitor_chroot_exit() {
    while read -r line
    do
        if [ "$line" == "exit" ]
        then break
        fi
    done < $MOUNT_POINT/exit.fifo

    # Send a SIGTERM signal to the parent process (which is running the chroot command)
    kill -s TERM $$
}

# Start the monitoring function in the background
monitor_chroot_exit &

# Enter the chroot environment in the foreground
export PATH=$PATH:/sbin:/usr/sbin:/bin:/usr/bin
chroot $MOUNT_POINT /bin/ash
