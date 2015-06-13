#!/bin/sh
if groups | grep games > /dev/null 2>&1 ; then 
  ryzom_sync 
  exec ryzom_client
  
else 
  echo "you need to be in games group to run ryzom"
  exit 1
fi
