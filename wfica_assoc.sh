#!/bin/sh
export ICAROOT=/opt/Citrix/ICAClient
exec ${ICAROOT}/wfica -associate -fileparam "$1"
