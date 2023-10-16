#!/bin/bash

# From: https://github.com/angristan/wireguard-install

SERVER_WG_NIC="wg0" #Default interface
SERVER_PUB_NIC=$(ip -4 route ls | grep default | grep -Po '(?<=dev )(\S+)' | head -1)
SERVER_PORT=$(grep -Po '(?<=ListenPort = )(\S+)' "/etc/wireguard/"$SERVER_WG_NIC".conf")

if [ "$1" == "up" ]; then
  iptables -I INPUT -p udp --dport $SERVER_PORT -j ACCEPT
  iptables -I FORWARD -i $SERVER_PUB_NIC -o $SERVER_WG_NIC -j ACCEPT
  iptables -I FORWARD -i $SERVER_WG_NIC -j ACCEPT
  iptables -t nat -A POSTROUTING -o $SERVER_PUB_NIC -j MASQUERADE
  ip6tables -I FORWARD -i $SERVER_WG_NIC -j ACCEPT
  ip6tables -t nat -A POSTROUTING -o $SERVER_PUB_NIC -j MASQUERADE
fi

if [ "$1" == "down" ]; then
  iptables -D INPUT -p udp --dport $SERVER_PORT -j ACCEPT
  iptables -D FORWARD -i $SERVER_PUB_NIC -o $SERVER_WG_NIC -j ACCEPT
  iptables -D FORWARD -i $SERVER_WG_NIC -j ACCEPT
  iptables -t nat -D POSTROUTING -o $SERVER_PUB_NIC -j MASQUERADE
  ip6tables -D FORWARD -i $SERVER_WG_NIC -j ACCEPT
  ip6tables -t nat -D POSTROUTING -o $SERVER_PUB_NIC -j MASQUERADE
fi
