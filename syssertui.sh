#!/bin/bash

while true; do
  services=$(systemctl list-unit-files | grep service | grep -v systemd | grep -v dbus | awk '{print $1}' | sed 's/\.[^.]*$//')
  services=$(printf "$services\nExit")
  service=$(gum filter $services --header "Choose the service to manage or select 'Exit' to exit: ")
  if [ "$service" = "" ] || [ "$service" = "Exit" ]; then
    break
  fi
  isactive=$(systemctl status $service".service" | grep Active | awk '{print $2}')
  isenabled=$(systemctl list-unit-files | grep $service".service" | awk '{print $2}')
  #printf "\n$service is $isenabled and $isactive\n\n"
  actions=$(printf "enable\nstart\nrestart\ndisable\nstop\nLogs")
  action=$(gum choose $actions --header "What do you want to do to $service? $service is $isenabled and $isactive")
  while true; do
    if [ "$action" = "" ]; then
      break
    elif [ "$action" = "Logs" ]; then
      printf "$(systemctl status $service)\n"
      printf "Press Enter to continue\n"
      read enter
      break
    fi
    sudo systemctl $action $service
    isactive=$(systemctl status $service".service" | grep Active | awk '{print $2}')
    isenabled=$(systemctl list-unit-files | grep $service".service" | awk '{print $2}')
    printf "$service is now $isenabled and $isactive\n"
    break
  done
done
