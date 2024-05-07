#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Backup the original resolv.conf file only if a backup doesn't exist yet
if [[ ! -e /etc/resolv.conf.bak ]]; then
    cp /etc/resolv.conf /etc/resolv.conf.bak
fi

# Verify that argument is provided
if [[ -z $1 ]]; then
    echo "Usage: $0 {g|sh|ag|cf|403|bg|rd|el|clear}"
    exit 1
fi

# Define the nameservers to add based on input argument
case $1 in
    g)
        nameservers=("nameserver 8.8.8.8" "nameserver 8.8.4.4")
        ;;
    sh)
        nameservers=("nameserver 178.22.122.100" "nameserver 185.51.200.2")
        ;;
    ag)
        nameservers=("nameserver 176.103.130.130" "nameserver 176.103.130.131")
        ;;
    cf)
        nameservers=("nameserver 1.1.1.1" "nameserver 1.0.0.1")
        ;;
    403)
        nameservers=("nameserver 10.202.10.202" "nameserver 10.202.10.102")
        ;;
    bg)
        nameservers=("nameserver 185.55.226.26" "nameserver 185.55.225.25")
        ;;
    rd)
        nameservers=("nameserver 10.202.10.10" "nameserver 10.202.10.11")
        ;;
    el)
        nameservers=("nameserver 78.157.42.100" "nameserver 78.157.42.101")
        ;;
    clear)
        nameservers=()
        ;;
    *)
        echo "Invalid option: $1"
        echo "Usage: $0 {g|sh|ag|cf|403|bg|rd|el|clear}"
        exit 1
        ;;
esac

# Remove all existing nameservers and add new ones atomically
# This avoids potential issues with an empty or partial file
{
    > /etc/resolv.conf.new
    for ns in "${nameservers[@]}"; do
        echo "$ns"
    done
} > /etc/resolv.conf.new

# Safely move the new file to the actual resolv.conf location
mv -f /etc/resolv.conf.new /etc/resolv.conf || { echo "Failed to update resolv.conf"; exit 1; }

# Confirm the changes
echo "The resolv.conf file has been updated:"
cat /etc/resolv.conf
