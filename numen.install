#!/bin/sh
cat << EOF > "/etc/udev/rules.d/80-uinput-$(logname).rules"
KERNEL=="uinput", OWNER="$(logname)", OPTIONS+="static_node=uinput"
EOF
udevadm trigger
