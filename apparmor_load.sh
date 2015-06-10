#!/bin/sh

aa_profiles='/etc/apparmor.d/'
aa_log='/var/log/apparmor.init.log'
/usr/bin/apparmor_parser -r $(find "$aa_profiles" -maxdepth 1 -type f) 2>> "$aa_log"
