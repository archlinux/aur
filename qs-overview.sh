#!/usr/bin/env bash

# The module name as recognized by Quickshell in XDG paths
MODULE_NAME="overview"

show_help() {
    echo "Quickshell Overview CLI"
    echo "Usage: qc-overview [command]"
    echo ""
    echo "Commands:"
    echo "  start   Launch the overview service"
    echo "  toggle  Toggle visibility"
    echo "  open    Force open"
    echo "  close   Force close"
}

case "$1" in
    start)
        # Quickshell checks ~/.config/quickshell then /etc/xdg/quickshell
        qs -c "$MODULE_NAME"
        ;;
    toggle)
        qs ipc -c "$MODULE_NAME" call overview toggle
        ;;
    open)
        qs ipc -c "$MODULE_NAME" call overview open
        ;;
    close)
        qs ipc -c "$MODULE_NAME" call overview close
        ;;
    *)
        show_help
        ;;
esac
