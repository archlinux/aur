#!/usr/bin/bash

export axoloti_release=/opt/axoloti-runtime
export axoloti_runtime=/opt/axoloti-runtime
export axoloti_firmware=/opt/axoloti-runtime/firmware
export axoloti_home="${XDG_DATA_HOME:-"$HOME/.local/share/"}/axoloti"

java -jar /usr/share/axoloti/Axoloti.jar "$@" 2>&1 | tee "$axoloti_home/axoloti.log"
