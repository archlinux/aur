#!/bin/sh
# Wrapper script to run thdmerge through Wine

# Run thdmerge with Wine, suppressing debug output
WINEDEBUG=-all wine /usr/share/eac3to/thdmerge.exe "$@"
exit_code=$?

# Reset terminal colors
tput init

# Preserve thdmerge's exit code
exit $exit_code
