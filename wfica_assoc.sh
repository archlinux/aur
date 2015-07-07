#!/bin/sh
export ICAROOT=/opt/Citrix/ICAClient
${ICAROOT}/wfica -associate -fileparam "$1"
