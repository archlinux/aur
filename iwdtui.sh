#!/bin/bash

while true; do

  if [ "$(pacman -Q | grep iwd)" = "" ]; then
    printf "This TUI is meant to be used to manage internet connections using iwd package.\nHowever, it seems you don't have it installed.\nIf you want to use iwd to connect to the internet, please install the package."
    break
  fi

  options=$(printf "Add\nRemove\nList\nExit")
  option=$(gum choose $options)

  if [ "$option" = "Add" ]; then
    devices=$(printf "station list" | iwctl | grep con | awk '{print $2}')
    device=$(gum choose $devices --header "What device do you want to connect?")
    if [ "$device" = "" ]; then
      break
    fi
    printf "station $device scan" | iwctl
    networks=$(iwctl station $device get-networks | sed -r 's/\x1B\[[0-9;]*[mK]//g' | awk 'BEGIN { start = 0 } /^[-]+$/ { start++; next } NF > 0 { print $1 }' | tail -n +3)
    network=$(gum choose $networks --header "What network do you want to connect to?")
    if [ "$network" = "" ]; then
      break
    fi
   
    enterprise=$(gum choose $(printf 'WPA-PSK\nWPA-Enterprise\nOpen') --header "How is the network secured? WPA-PSK are protected only by a password. WPA-Enterprise require additional fileds, such as a username. Open networks are not protected.")
    if [ "$enterprise" = "" ]; then
      break

    elif [ "$enterprise" = "Open" ]; then
      iwctl station $device connect $network

    elif [ "$enterprise" = "WPA-PSK" ]; then
      touch $network.psk
      echo "[Security]" > "$network".psk
      passp=$(gum input --header "What is the passphrase?")
      echo "Passphrase=$passp" >> "$network".psk
      sudo mv ./$network.psk /var/lib/iwd/
      
      echo "You should be now connected to $network"

    
    elif [ "$enterprise" = "WPA-Enterprise" ]; then
      auths=$(gum choose $(printf 'PWD\nPEAP\nTTLS') --header "What kind of authentication does it use?")
      echo "[Security]" > "$network".8021x
      echo "EAP-Method=$auths" >> "$network".8021x
      identity=$(gum input --header "What is your identity given by your organization? i.e. username, email")
      echo "EAP-Identity=$identity" >> "$network".8021x

      if [ "$auths" = "PWD" ]; then
        password=$(gum input --header "What is the password for $network?")
        echo "EAP-Password=$password" >> "$network".8021x
      fi

      if [ "$auths" = "PEAP" ]; then
        echo "EAP-PEAP-Phase2-Method=MSCHAPV2" >> "$network".8021x
        echo "EAP-PEAP-Phase2-Identity=$identity" >> "$network".8021x
        password=$(gum input --header "What is the password for $network?")
        echo "EAP-PEAP-Phase2-Password=$password" >> "$network".8021x
        cacert=$(gum input --header "Please write the path to the CA certificate. Leave blank if none")
        if [ "$cacert" != "" ]; then
          echo "EAP-PEAP-CACert=$cacert" >> "$network".8021x
        fi
        mask=$(gum input --header "Please write the server domain mask (if any)")
        if [ "$mask" != "" ]; then
          echo "EAP-PEAP-ServerDomainMask=$mask" >> "$network".8021x
        fi
      fi

      if [ "$auths" = "TTLS" ]; then
        echo "EAP-TTLS-Phase2-Method=Tunneled-PAP" >> "$network".8021x
        echo "EAP-TTLS-Phase2-Identity=$identity" >> "$network".8021x
        password=$(gum input --header "What is the password for $network?")
        echo "EAP-TTLS-Phase2-Password=$password" >> "$network".8021x
        cacert=$(gum input --header "Please write the path to the CA certificate. Leave blank if none")
        if [ "$cacert" != "" ]; then
          echo "EAP-TTLS-CACert=$cacert" >> "$network".8021x
        fi
        mask=$(gum input --header "Please write the server domain mask (if any)")
        if [ "$mask" != "" ]; then
          echo "EAP-TTLS-ServerDomainMask=$mask" >> "$network".8021x
        fi
      fi

      echo "" >> "$network".8021x
      echo "[Settings]" >> "$network".8021x
      echo "AutoConnect=true" >> "$network".8021x

      sudo mv ./$network.8021x /var/lib/iwd

      echo "You should be now connected to $network"
    fi
  fi

  if [ "$option" = "Remove" ]; then
    networks=$(sudo ls -1 /var/lib/iwd/ -I hotspot)
    ntr=$(gum choose $networks --header "What network do you want to remove?")
    if [ "$ntr" = "" ]; then
      break
    fi
    sudo rm /var/lib/iwd/$ntr
    echo "The network stored in $ntr has been forgotten"
  fi

  if [ "$option" = "List" ]; then
    networks=$(sudo ls -1 /var/lib/iwd/ -I hotspot | sed 's/\.[^.]*$//')
    networks=$(printf "Disconnect\n""$networks""\nExit")
    station=$(iwctl station list | grep connected | grep disconnected | awk '{print $2}')
    condis=$(gum choose $networks --header "You can choose to connect to another known network or to disconnect.")
    if [ "$condis" = "" ] || [ "$condis" = "Exit" ]; then
      break
    elif [ "$condis" = "Disconnect" ]; then
       iwctl station $station disconnect
    else
       iwctl station $station disconnect
       iwctl station $station connect $condis
       echo "You should now be connected to $condis"
    fi
  fi

  if [ "$option" = "Exit" ] || [ "$option" = "" ]; then
    break
  fi
done
