#!/bin/bash
# Wrapper for makepkg with ephemeral ru-check

REAL_MAKEPKG="/usr/bin/makepkg.real"
CHECKER="/usr/local/bin/suspcheck.sh"
PKGBUILD_PATH="$(pwd)/PKGBUILD"

# Create/clear session scratchpad at start
SESSION_FILE="/tmp/suspcheck-session-$$"
: > "$SESSION_FILE"

# Skip ru-check for helper calls
case " $* " in
  *"--packagelist"*|*"--printsrcinfo"*|*"--help"* )
    exec "$REAL_MAKEPKG" "$@"
    ;;
esac

# Run ru-check if PKGBUILD exists
if [[ -f "$PKGBUILD_PATH" ]]; then
    PKGNAME=$(grep -m1 '^pkgname=' "$PKGBUILD_PATH" | cut -d= -f2)
    if [[ -n "$PKGNAME" ]]; then
        DECISION=$(grep -m1 "^$PKGNAME:" "$SESSION_FILE" | cut -d: -f2)
        if [[ "$DECISION" == "ALLOW" ]]; then
            echo "✅ Cached: allow $PKGNAME"
        elif [[ "$DECISION" == "DENY" ]]; then
            echo "❌ Cached: deny $PKGNAME"
            rm -f "$SESSION_FILE"
            exit 1
        else
            if ! "$CHECKER" "$PKGBUILD_PATH"; then
                echo "$PKGNAME:DENY" >>"$SESSION_FILE"
                rm -f "$SESSION_FILE"
                exit 1
            else
                echo "$PKGNAME:ALLOW" >>"$SESSION_FILE"
            fi
        fi
    fi
fi

# ---- Cleanup logically at very end ----
rm -f "$SESSION_FILE"

# Continue with real makepkg
exec "$REAL_MAKEPKG" "$@"
