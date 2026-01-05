#!/bin/sh
# Add vendor directory to PYTHONPATH
export PYTHONPATH="/opt/ca-racing/vendor${PYTHONPATH:+:}${PYTHONPATH}"
# Execute the main script
exec python /opt/ca-racing/main.py "$@"
