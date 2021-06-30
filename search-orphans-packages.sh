#!/bin/bash
all_off="$(tput sgr0)"
bold="${all_off}$(tput bold)"
blue="${bold}$(tput setaf 4)"

note() {
    printf "${blue}:: ${bold}$1${all_off}\n"
}

pacman -Qdtt || note "No orphaned packages found." 
