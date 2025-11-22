#!/bin/sh
# Wrapper script to run eac3to through Wine

# Run eac3to with Wine, suppressing debug output
WINEDEBUG=-all wine /usr/share/eac3to/eac3to.exe "$@"
exit_code=$?

# Reset terminal colors
tput init

# Preserve eac3to's exit code
exit $exit_code
