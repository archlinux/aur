#!/bin/sh
## DOA wrapper script

# Must run as root
if [ "$UID" -ne 0 ]; then
	if which "$PACMAN_AUTH" > /dev/null 2>&1; then
		exec $PACMAN_AUTH $0 $@
	elif which sudo > /dev/null 2>&1; then
		exec sudo $0 $@
	fi

	echo "Script must be run as root"
	exit 1
fi

# Activate conda
[ -f /opt/miniforge/etc/profile.d/conda.sh ] && source /opt/miniforge/etc/profile.d/conda.sh
cd /opt/kraken
conda activate ./conda

# Select option
case "$1" in
	start)
		./kraken_doa_start.sh
		;;
	stop)
		./kraken_doa_stop.sh
		;;
	*)
		printf "Invalid command\n"
		printf "usage: $0 [action]\n"
		printf "\tstart - Start KrakenSDR DOA\n"
		printf "\tstop - Stop KrakenSDR DOA\n"
		exit 1
		;;
esac
