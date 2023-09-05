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
    echo "Usage: $0 {g|sh}"
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
    *)
        echo "Invalid option: $1"
        echo "Usage: $0 {g|sh}"
        exit 1
        ;;
esac

# Remove all existing nameservers and add new ones atomically
# This avoids potential issues with an empty or partial file
{
    > /etc/resolv.conf
    for ns in "${nameservers[@]}"; do
        echo "$ns"
    done
} > /etc/resolv.conf.new

mv /etc/resolv.conf.new /etc/resolv.conf

# Confirm the changes
echo "The resolv.conf file has been updated:"
cat /etc/resolv.conf
