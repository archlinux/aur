#!/bin/sh
#
# This script is a "fake" gnome-terminal, created by the
# nvidia-sync-terminal-fix package.
#

HOLD_COMMAND="echo '---'; echo 'SSH command finished. Press Enter to close.'; read"

shift # Discard $1 (which is --)

# --- Argument Parsing ---
# We will loop through arguments until we find the one that
# is *not* an option (like -t) and *not* the command (ssh).
# That will be the host.

# Initialize empty vars
SSH_CMD_AND_FLAGS=""
HOST=""

# The first arg is the command itself
SSH_CMD="$1"
shift

while [ -n "$1" ]; do
    case "$1" in
        -*)
            # It's an option (like -t)
            SSH_CMD_AND_FLAGS="$SSH_CMD_AND_FLAGS $1"
            shift # Move to the next argument
            ;;
        *)
            # Not an option. This MUST be the host.
            HOST="$1"
            shift # Move to the next argument
            break   # Stop parsing flags
            ;;
    esac
done

# Whatever is left in $@ is the remote command.
# "$*" joins them all into a single string.
REMOTE_CMD="$*"

# Assemble the final command, correctly quoting the *last* part
CMD_STRING="$SSH_CMD $SSH_CMD_AND_FLAGS $HOST \"$REMOTE_CMD\""

# Trim leading space
CMD_STRING=$(echo "$CMD_STRING" | sed 's/^ *//')

# --- Terminal Detection ---
# (This logic is fine)
if [ -n "$TERMINAL" ] && command -v "$TERMINAL" >/dev/null; then
    PREFERRED_TERM=$(command -v "$TERMINAL")
else
    for t in /usr/bin/ghostty /usr/bin/konsole /usr/bin/alacritty; do
        if [ -x "$t" ]; then
            PREFERRED_TERM="$t"
            break
        fi
    done
fi

# --- Execution ---
if [ -n "$PREFERRED_TERM" ]; then
    case "$(basename "$PREFERRED_TERM")" in
        "ghostty" | "alacritty" | "konsole")
            exec "$PREFERRED_TERM" -e sh -c "$CMD_STRING; $HOLD_COMMAND"
            ;;
        *)
	    exec "$PREFERRED_TERM" -e sh -c "$CMD_STRING; $HOLD_COMMAND" 2>/dev/null || \
                 exec "$PREFERRED_TERM" sh -c "$CMD_STRING; $HOLD_COMMAND"
            ;;
    esac
else
    echo "No supported terminal found."
    exit 1
fi
