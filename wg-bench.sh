#!/bin/sh

# Check if running as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Error: This script must be run as root." >&2
    exit 1
fi

# Define help message
print_help() {
    cat <<EOF
Usage: ${0##*/} [command]

Available commands:
    setup-netns    Set up network namespaces
    benchmark      Run the benchmark
    clean-up       Clean up resources
    config         Edit the configuration file

Please run as root.
EOF
}

# Validate arguments
if [ $# -ne 1 ]; then
    print_help >&2
    exit 1
fi

COMMAND="$1"
WG_BENCH_DIR="/opt/wg-bench"

case "$COMMAND" in
    setup-netns|benchmark|clean-up)
        # Execute corresponding script
        SCRIPT_PATH="${WG_BENCH_DIR}/${COMMAND}.sh"
        if [ ! -f "$SCRIPT_PATH" ]; then
            echo "Error: Required script $SCRIPT_PATH not found." >&2
            exit 1
        fi
        cd "$WG_BENCH_DIR" || {
            echo "Error: Could not access directory $WG_BENCH_DIR" >&2
            exit 1
        }
        $SCRIPT_PATH
        ;;
    config)
        # Edit config with $EDITOR or fallback to vi
        CONFIG_PATH="${WG_BENCH_DIR}/config.sh"
        EDITOR="${EDITOR:-vi}"
        if ! command -v "$EDITOR" >/dev/null 2>&1; then
            echo "Error: Editor '$EDITOR' not found." >&2
            exit 1
        fi
        "$EDITOR" "$CONFIG_PATH"
        ;;
    *)
        print_help >&2
        exit 1
        ;;
esac