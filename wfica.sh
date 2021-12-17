#!/bin/sh
export ICAROOT=/opt/Citrix/ICAClient
exec ${ICAROOT}/wfica -file "$1"
