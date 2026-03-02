# Settings file for OpenRC Init script for 'temp-throttle' (https://github.com/Sepero/temp-throttle).
# Distributed under the terms of the GNU General Public License version 3.0, or any later version at your choice.
# (c) dreieck, 2026-03-02.

# 'temp_throttle_config': Config file to use. If not set or empty string, the init script uses a default.
temp_throttle_config=/etc/temp-throttle.conf

# 'temp_throttle_pidfile': PID file to use by the init script. If not set or empty, the init script uses a default.
temp_throttle_pidfile=/run/temp-throttle.pid

# 'temp_throttle_logfile': Where to log the output to. Leave empty (empty string) or unset to disable logging.
temp_throttle_logfile=/var/log/temp-throttle.log

# 'temp_throttle_extra_args': Variable holding additional command line arguments to be passed to 'temp-throttle' when started via initscript '/etc/inid.d/wireplumber'.
# 
# The following usage information was extracted from '/usr/bin/temp-throttle', version 3.02, on 2026-03-02:
# 
#   Usage: temp-throttle [-t MAX_TEMP] [-c CONFIG_FILE] [-k CORE] [-f TEMP_FILE] [-i INTERVAL] [-l LOG_FILE]
# 
#   MAX_TEMP=""    # Maximum desired CPU temperature.
#   CONFIG_FILE="/etc/temp-throttle.conf" # Optional configuration file.
#   TEMP_FILE=""   # Optional file to force read CPU temperature from.
#   INTERVAL=3     # Optional seconds between checking CPU temperature. Default 3.
#   LOG_FILE="-"   # Optional log file. Default output to standard out.
#   CORE="0"       # Optional CPU Core to read frequency information from. Default 0.

temp_throttle_extra_args=''
