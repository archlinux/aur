#!/bin/sh    
 if [ -f /etc/machine-id  ]; then        
   rm /etc/machine-id && \    
   systemd-machine-id-setup    
 fi
