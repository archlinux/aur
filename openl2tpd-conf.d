# Settings for the OpenL2TP daemon.
# OPENL2TPDARGS= :  any extra command-line startup arguments for crond
#	-R              - allow remote management using RPC
#	-d nnn          - set debug trace mask to nnn
#       -L log-facility - set syslog facility (default LOG_DAEMON) 
#
# OPENL2TPD_CONFIG_FILE= : a file containing L2TP config that
#                          is loaded when openl2tpd starts up.

# Use ipsec.so plugin for IPSec setups.
#OPENL2TPDARGS="-p ipsec.so"
OPENL2TPDARGS=

# Config file to load at openl2tpd startup
OPENL2TPD_CONFIG_FILE=


