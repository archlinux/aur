#!/bin/sh
mnt defaults,nosuid,nodev tmpfs   none /tmp
mnt defaults              cgroup2 none /sys/fs/cgroup
