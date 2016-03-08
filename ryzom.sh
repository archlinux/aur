#!/bin/sh
if groups | grep games > /dev/null 2>&1 ; then 
  #sync data files	
  ryzom_sync 
  #update default config file
  mkdir -p ~/.ryzom
  cp /etc/ryzom/client_default.cfg ~/.ryzom/client_default.cfg
  #run game
  exec ryzom_client
  
else 
  echo "you need to be in games group to run ryzom"
  exit 1
fi
