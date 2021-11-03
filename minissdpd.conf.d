### Configuration for the minissdpd-Daemon -- overrides the defaults set in /etc/init.d/minissdpd.

# Where to listen on -- specify either an IPv4 address with mask (e.g. "192.168.1.42/255.255.255.0"), or a network interface name (e.g. "eth0"). Can be multiple entries, specified as a bash array. Note that the interface(s) must be up  at the time the daemon is started.  NOTE: Network address specification might not work and throw an error, try it out.
# _IFACE=192.168.1.42/255.255.255.0
# _IFACE=eth0
# _IFACE=wlan0
# _IFACE=(eth0 wlan0)
_IFACE=lo

# Use the following PID-file:
_PIDFILE="/var/run/minissdpd.pid"

# Communicate via the following socket:
_SOCKET="/var/run/minissdpd.sock"

# The executable to run
_DAEMON="/usr/bin/minissdpd"

# Should we enable IPv6 in addidion to IPv4?
_IP6="true"

# TTL of the package. By default 2 is used according to UDA.
_TTL=2

# search/filter a specific device type. Leave commented out to not apply the filter.
#_DEVFILTER=devtype

# Should we generate log/ debug output?
_DEBUG="false"

# Logfile which is used in case $_DEBUG is true
_LOGFILE="/var/log/minissdpd.log"
