#!/bin/bash

# Check if icon directory exists
ICON_BASE="/usr/share/icons/breeze-dark/status/16"
if [[ ! -d "$ICON_BASE" ]]; then
    logger -t fnq-monitor "Icon directory $ICON_BASE not found. Falling back to default icon."
    ICON_BASE="/usr/share/icons/hicolor/scalable/status"
fi

ACPI_CALL_PATH="/proc/acpi/call"
METHOD_NAME="\_SB.PCI0.LPC0.EC0.GZ44"

# Check if acpi_call module is loaded
if [[ ! -e "$ACPI_CALL_PATH" ]]; then
    logger -t fnq-monitor "acpi_call module not loaded. Attempting to load..."
    pkexec modprobe acpi_call || {
        logger -t fnq-monitor "Failed to load acpi_call module"
        exit 1
    }
fi

logger -t fnq-monitor "Starting Fn+Q monitoring service..."

# Monitor ACPI events
acpi_listen | while read -r line; do
    if [[ "$line" == "wmi PNP0C14:00 000000d5 00000000" ]]; then
        result=$(echo "$METHOD_NAME" | pkexec tee "$ACPI_CALL_PATH" > /dev/null && pkexec cat "$ACPI_CALL_PATH" | tr -d '\000\r\n')

        case "$result" in
            0x0)
                ICON="$ICON_BASE/temperature-normal.svg"
                TEXT="Intelligent Cooling"
                ;;
            0x1)
                ICON="$ICON_BASE/temperature-warm.svg"
                TEXT="Extreme Performance"
                ;;
            0x2)
                ICON="$ICON_BASE/temperature-cold.svg"
                TEXT="Quiet Mode"
                ;;
            *)
                ICON="$ICON_BASE/temperature.svg"
                TEXT="Unknown Mode ($result)"
                ;;
        esac

        # Check if qdbus is available
        if command -v qdbus >/dev/null 2>&1; then
            qdbus org.freedesktop.Notifications /org/kde/osdService org.kde.osdService.showText "$ICON" "$TEXT" || \
                logger -t fnq-monitor "Failed to show notification"
        else
            logger -t fnq-monitor "qdbus not found, notification skipped"
        fi
    fi
done
