#!/bin/bash
# HyPrism launcher wrapper with optional sandbox override.
#
# This script launches the HyPrism application located in /opt/hyprism-bin/.
# By default, the Electron sandbox is enabled to ensure security.
#
# If you encounter startup issues in certain environments
# (e.g., containerized or restricted systems), you can disable the sandbox by setting:
#
#   HYPRISM_NO_SANDBOX=1
#
# Example:
#   HYPRISM_NO_SANDBOX=1 hyprism
#
# Warning: Disabling the sandbox reduces security and should only be used when absolutely necessary.
# Never run this application as root.

HYPRISM_BIN="/opt/hyprism-bin/HyPrism"

if [[ "${HYPRISM_NO_SANDBOX}" == "1" ]]; then
    exec "${HYPRISM_BIN}" --no-sandbox "${@}"
else
    "${HYPRISM_BIN}" "${@}" || {
        echo "HyPrism failed to start." >&2
        echo "Try running with sandbox disabled: HYPRISM_NO_SANDBOX=1 ${0}" >&2
        echo "Warning: Disabling the sandbox reduces security." >&2
        echo "Never run this application as root." >&2
        exit 1
    }
fi
