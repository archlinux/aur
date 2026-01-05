#!/bin/sh
# Add vendor directory to PYTHONPATH
export PYTHONPATH="/opt/ca-racing/vendor${PYTHONPATH:+:}${PYTHONPATH}"
# Change to the application directory
cd /opt/ca-racing || exit
# Execute the main script
exec python main.py "$@"
