#!/bin/sh
#
# Creator: Soul_Est
# Email: soul.est.soul.est@gmail.com
#
# Shim for QTSixA until it's fully compatible with systemd
# The ":" command idea taken from here: http://ynniv.com/blog/2005/04/doing-nothing-in-bash.html#c3664104150986936775
#
case "$1" in
	start)
		# It does nothing and has a 0.00s runtime!
		#: && exit 0
		# Uncomment the next line if you use regular bluetooth
		systemctl start bluetooth.service && exit 0
		;;
	stop)
		# It does nothing and has a 0.00s runtime!
		#: && exit 0
		# Uncomment the next line if you use regular bluetooth
		systemctl stop bluetooth.service && exit 0
		;;
	restart)
		# It does nothing and has a 0.00s runtime!
		#: && exit 0
		# Uncomment the next line if you use regular bluetooth
		systemctl restart bluetooth.service && exit 0
		;;
esac
exit 1
