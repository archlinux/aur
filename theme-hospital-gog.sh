#!/bin/bash
#
# simple launcher by carstene1ns 2014
#

# get script name
script=${0##*/}

# get game mode
mode=${script#theme-hospital-}

case "$mode" in
  client)
    EXTRACONF=dosboxth_client.conf
    ;;
  server)
    EXTRACONF=dosboxth_server.conf
    ;;
  settings)
    EXTRACONF=dosboxth_settings.conf
    ;;
  *)
    EXTRACONF=dosboxth_single.conf
esac

# launch
cd /opt/theme-hospital && exec dosbox -conf dosboxth.conf -conf $EXTRACONF

# eof
