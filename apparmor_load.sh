#!/bin/sh

aa_profiles='/etc/apparmor.d/'
aa_log='/var/log/apparmor.init.log'
find "$aa_profiles" -maxdepth 1 -type f -exec /usr/bin/apparmor_parser -r {} + 2>> "$aa_log"
