#!/bin/sh

# A script for updating Archlinux using pacmatic and pacaur

export pacman_program="pacaur"
export pacdiff_program="sudo pacdiff"
pacmatic -Syu
read -p "Press enter to continue..."
