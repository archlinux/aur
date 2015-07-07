#!/bin/bash

# drpadmin - adminstrative tool for adding and removing portservers,
#    tty devices, and configuration files on servers not running xWindows.
#    From drpadmin written by Digi for SCO, HP UX, and Solaris

. /usr/bin/dgrp/config/file_locations
if [ "$DGRP_STORE" = "" ]; then
  echo "$0: Can't find backing store from file locations."
  exit 2
fi

ttyname=tty # driver prefix
procdir=`dirname "$DGRP_PROCCONFIG"`
distro="Linux" # Originally made for Arch Linux
# Installers can use sed -i to change this next line to the appropriate distro name
#distro=:::

check_devid() {
  case $1 in
  [a-o,q-z]|[a-z][a-z]);;
  p)printf "**** p cannot be used. p is reserved for psuedo devices!"
    return 1
    ;;
  *)printf "**** Please enter 1 or 2 alpha characters"
    return 1
    ;;
  esac
  return 0
}

check_kernel() {
  if [ ! -d "$procdir" ]; then
    modprobe dgrp
  fi
  if [ -d "$procdir" ]; then
    lines=`wc -l "$DGRP_PROCCONFIG" | cut -d " " -f 1`
    if [ "$lines" -eq 0 ]; then
      echo "The kernel module is loaded but no devices are active" 
      # this is not possible because the config file is removed and the kernel module is unloaded when the last device is uninit
    fi
  else
    echo "The kernel module is not loaded"
    if [ -s "$DGRP_STORE" ]; then
      echo "A configuration exists but will not be active until the kernel module is loaded"
    else
      echo "Add any device to load the kernel module"
    fi
    return 1
  fi
  return 0
}

#
# add a PortServer entry
#
add_ps() {
  check_kernel
  while true; do
    printf "\nEnter the host name or IP address: "
    read node
    if [ "$node" = "" -o "$node" = "0" ]; then
      return
    fi

    ping -c 4 "$node"

    while true; do
      printf "Enter the number of ports: "
      read ndev
      if [ "$ndev" = "" -o "$ndev" = "0" ]; then
        return
      fi
      if [ "$ndev" -ge 1 -a "$ndev" -le 64 ]; then
        break
      fi
      printf "\n**** Please enter a number from 1 to 64\n\n"
    done

    while true; do
      printf "Enter the tty device ID (1 or 2 lower case alpha characters) : "
      read devid
      if [ "$devid" = "" -o "$devid" = "0" ]; then
        return
      fi
      check_devid $devid
      if [ $? -ne 0 ]; then
        continue
      fi

      while true; do
        printf "\n\nWould you like this RealPort session to be encrypted?\n\n"
        printf "NOTE: Not all RealPort products support encrypted RealPort sessions.\n"
        printf "Please check your RealPort product's firmware release notes\n"
        printf "or product literature before selecting \"always\".\n"
        printf "If in doubt, select \"never\".\n\n"
        printf "(always/never) : (never): "

        read secure
        if [ -z "$secure" ]; then
          secure="never"
        fi

        case $secure in
        [aA])
          secure="always"
          secureopt="always"
          ;;
        always)
          secureopt="always"
          ;;
        [nN])
          secure="never"
          secureopt="never"
          ;;
        never)
          secureopt="never"
          ;;
        *)
          printf "\nPlease answer (a)lways or (n)ever.\n" >&2
          ;;
        esac

        if [ ! -z "$secureopt" ]; then
          break
        fi
      done

      while true; do
        printf "\nIf the network connection between your Server system\n"
        printf "and the remote device includes a WAN link slower than 1 MBit,\n"
        printf "see the drpd manual page and enter the WAN speed here : "
        read wan
        if [ -z "$wan" ]; then 
          break
        fi
        printf "\n**** "
        #expr "$s" : '.*:\(.*\)'
      done

      printf "\nThe following device will be configured,\n"
      printf "$node\t$ndev\t$ttyname$devid$start-$ttyname$devid$p\t\tsecure ($secureopt)\t$wan\n"
      printf "\nIs this correct (y to add or x to abort) ? "
      read ans
      if [ -z "$ans" ]; then
        printf "\nEmpty response, not configuring this device.\n"
        return
      fi
      if [ $ans = 'x' ]; then
        printf "\nx pressed, not configuring this device.\n"
        return
      fi
      if [ $ans = 'y' ]; then
        if [ "$wan" != "" ]; then
          $wan = "-s $wan"
        fi
        echo "$DGRP_CFG" -v -e $secureopt $wan init $devid $node $ndev
        "$DGRP_CFG" -v -e $secureopt $wan init $devid $node $ndev
        return
      fi
    done
  done
}

#
# delete a PortServer device
#
delete_ps() {
  check_kernel
  if [ $? -ne 0 ]; then
    return
  fi
  show_ps
  printf "\nEnter the 2 letter id of the device to delete: "
  read devid
  check_devid $devid
  if [ $? -ne 0 ]; then
    return
  fi
  echo "$DGRP_CFG" -v uninit "$devid"
  "$DGRP_CFG" -v uninit "$devid"
}

#
# reset by stop/start a PortServer device
#
# $1 = 0 for reset, 1 for move
# $2 = word to display like "Resetting" or "Moving"
# $3 = word to display like "reset" or "move"
# $4 = word to display like "" or "new"
resetmove_ps() {
  check_kernel
  if [ $? -ne 0 ]; then
    return
  fi
  show_ps
  printf "\nWarning: $2 a device will disconnect all active connections!\n"
  printf "Enter the 1 or 2 letter device to $3: "
  read devid
  check_devid $devid
  if [ $? -ne 0 ]; then
    return
  fi
  node=`grep "^$devid[^0-9]" "$DGRP_STORE" | cut -d " " -f 2`
  if [ "$node" = "" ]; then
    printf "Device $devid not found"
  fi
  if [ "$1" -eq 1 ]; then
    printf "\nEnter the $4 host name or IP address: "
    read node
    if [ "$node" = "" -o "$node" = "0" ]; then
      return
    fi
    echo ping -w 4 -c 4 "$node"
    ping -w 4 -c 4 "$node"
  fi
  echo "$DGRP_CFG" -v stop "$devid"
  "$DGRP_CFG" -v stop "$devid"
  echo "$DGRP_CFG" -v start "$devid" "$node"
  "$DGRP_CFG" -v start "$devid" "$node"
}

show_ps() {
  check_kernel
  if [ -s "$DGRP_STORE" ]; then
    lines=`wc -l "$DGRP_STORE" | cut -d " " -f 1`
  else
    lines=0
  fi
  if [ "$lines" -eq 0 ]; then
    echo ""
    echo "No devices are configured."
  elif [ "$lines" -lt 20 ]; then
    echo `grep PortCount "$DGRP_STORE" | cut -d " " -f3-`
    grep "^[a-z]" "$DGRP_STORE"
  else
    less "$DGRP_STORE"
  fi
}

show_info() {
  check_kernel
  if [ $? -eq 0 ]; then
    if [ "$lines" -lt 20 ]; then
      cat "$DGRP_PROCCONFIG"
    else
      less "$DGRP_PROCCONFIG"
    fi
  fi
}

show_node() {
  check_kernel
  if [ $? -eq 0 ]; then
    if [ "`wc -l "$procdir/nodeinfo" | cut -d " " -f 1`" -lt 20 ]; then
      cat "$procdir/nodeinfo"
    else
      less "$procdir/nodeinfo"
    fi
  fi
}

show_version() {
  check_kernel
  if [ $? -eq 0 ]; then
    if [ "`wc -l "$procdir/info" | cut -d " " -f 1`" -lt 20 ]; then
      cat "$procdir/info"
    elif [ "$lines < 20" ]; then
      less "$procdir/info"
    fi
  fi
}

# main body

echo ""

if [ "$EUID" -ne 0 ]; then
  printf "\nDigi Realport Current Configuration:\n"
  show_ps
else
  echo "Digi Realport Configuration Menu for $distro"
  echo ""
  echo "Add     - add a new device configuration (init)"
  echo "Delete  - delete a device configuration (uninit)"
  echo "Reset   - reset a single device by stopping and starting it"
  echo "Move    - change IP address for a device without losing configuration"
  echo "Show    - display set configuration $DGRP_STORE"
  echo "Kernel  - display active configuration $DGRP_PROCCONFIG"
  echo "Node    - display active nodes $procdir/nodeinfo"
  echo "Version - display kernel version and debugging info $procdir/info"
fi

check_kernel

if [ -d "$procdir" ]; then
  echo ""
  echo "Kernel Status: Running"
  lines=`grep "^[^#].*" "$procdir/config" | wc -l | cut -d " " -f 1`
  if [ "$lines" -eq 0 ]; then
    echo "Device Count : $lines"
    echo "systemctl start dgrp_daemon.service"
    systemctl start dgrp_daemon.service
    echo "systemctl start dgrp_ditty.service"
    systemctl start dgrp_ditty.service
    lines=`grep "^[^#].*" "$procdir/config" | wc -l | cut -d " " -f 1`
  fi
  echo "Device Count : $lines"
else
  echo ""
  echo "Kernel status: NOT RUNNING"
fi

if [ "$EUID" -ne 0 ]; then
  printf "\nMust be root to use $0\n"
  exit 2
fi

while true; do
  printf "\nOp: (a)dd (d)elete (r)eset (s)how (k)ernel (n)ode (v)ersion (q)uit:"
  read opt
  case $opt in
  'a') add_ps ;;
  'd') delete_ps;;
  'r') resetmove_ps 0 "Resetting" "reset" "";;
  #'m') resetmove_ps 1 "Moving" "move" "new";; # Doesn't work according to the instructions
  's') show_ps;;
  'k') show_info;;
  'n') show_node;;
  'v') show_version;;
  'q') echo "man `basename $DGRP_CFG` for advanced configuration options"; exit 0;;
  esac
done
