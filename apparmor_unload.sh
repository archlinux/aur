#!/bin/sh

aa_profiles='/etc/apparmor.d/'
aa_log='/var/log/apparmor.init.log'
PROFILES=`find "$aa_profiles" -maxdepth 1 -type f`
for profile in $PROFILES; do
    apparmor_parser -R "$profile" 2>> "$aa_log"
done
