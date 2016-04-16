#!/usr/bin/bash

if [ -w /sys/devices/platform/clevo_wmi/kbled/left ]
then
	/usr/bin/env python -m clevo_wmi-gui
else
	gksudo "/usr/bin/env python -m clevo_wmi-gui"
fi
