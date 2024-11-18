#!/bin/bash

# Set the directory and executable
EXEC_DIR="/usr/share/hyperrogue"
EXECUTABLE="app"
#
# # Change to the executable's directory
cd "$EXEC_DIR" || { echo "Error: Could not change directory to $EXEC_DIR"; exit 1; }
#
# # Run the executable
./"$EXECUTABLE" || { echo "Error: $EXECUTABLE failed to run"; exit 1; }
#
# # Exit successfully
echo "$EXECUTABLE ran successfully."
exit 0
