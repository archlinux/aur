#!/bin/bash

# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Backup the original resolv.conf file
cp /etc/resolv.conf /etc/resolv.conf.bak

# Remove all existing nameservers
> /etc/resolv.conf

# Add the nameservers 8.8.8.8 and 8.8.4.4
if [ $1 == 'g' ]; then
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
fi
if [ $1 == 'sh' ]; then
echo "nameserver 178.22.122.100" >> /etc/resolv.conf
echo "nameserver 185.51.200.2" >> /etc/resolv.conf
fi


# Confirm the changes
echo "The resolv.conf file has been updated:"
cat /etc/resolv.conf

#mohammadrostamidev.ir
#https://github.com/mohammadrostamiorg


# you can use aliases for easer changing for example alias shecan=sudo sh ~/dnsChanger/dnsch.sh sh in other distroes 
