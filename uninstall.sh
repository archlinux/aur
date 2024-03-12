#!/bin/bash

user_home=$(getent passwd $(logname) | cut -d: -f6)

sudo systemctl stop ddh
sudo systemctl disable ddh
sudo rm -f /usr/local/bin/ddh.sh
sudo rm -f /etc/systemd/system/ddh.service
sudo rm -rf $user_home/.config/ddh

