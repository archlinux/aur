#!/bin/bash
sleep 3650d | "$@" &
echo $! > /run/craftbukkit/pid
