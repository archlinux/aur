### Configuration for the minissdpd-Daemon -- overrides the defaults set in /etc/init.d/minissdpd.

# Optional: Override the exeecutable to run:
#_DAEMON="/usr/bin/gerbera"

# Either this is needed: Use the following config file:
_CONFIGFILE=/etc/gerbera/gerbera.xml

# Or alternatively, this is needed: Search this directory for a .config/gerbera folder containing a config file (DO NOT SET if you don't need it) (_CONFIGFILE, if set, takes precedence):
#_CONFIG_HOME=/root
# Override folder below $_CONFIG_HOME from default `.config/gerbera` to this value (DO NOT SET if you don't need it):
#_CONFIG_HOME_FOLDER=.config/gerbera

# Optional: Override "run as the following user":
#_USER=gerbera

# Optional: Bind to the following network interface:
#_IFACE=lo

# Optional: Use the following port (must be >=49152):
#_PORT=49153

# Optional: Bind to the following IP:
#_IP=127.0.0.1

# Optional: Should we generate log/ debug output?
#_DEBUG="false"

# Optional: Override default logfile:
#_LOGFILE="/var/log/gerbera.log"

# Optional: Override default PID file:
#_PIDFILE=/var/run/gerbera.pid
