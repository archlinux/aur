#!/bin/sh
checkupdates &
pacman -Qm | aur vercmp &
wait
