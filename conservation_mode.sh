#!/bin/sh

if [ $EUID -ne 0 ]; then echo pls run with root user && exit 127; fi

if [ $# -eq 0 ]; then /usr/bin/tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode <<< 1 && exit 0; fi

/usr/bin/tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004\:00/conservation_mode <<< 0