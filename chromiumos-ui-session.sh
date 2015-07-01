#!/bin/sh

# chromiumos-ui-session: Chromium OS UI session manager

# Enable monitor mode
# Background processes will be placed in their own process groups
set -m

LOGINFO=$(basename "$0")"($$)"
log() {
	sed -e "s/^/$LOGINFO: /" >&2
}

get_pgid() {
	ps -o pgid= $1 | tr -d ' '
}

get_pgid_pids() {
	pgrep -g $1
}

log_remaining_pids() {
	local pids
	pids=$*

	echo "Remaining processes: ${pids:-none}" | log
}

kill_pgid() {
	local pgid signal
	pgid=$1
	signal=${2:-TERM}

	echo "Sending SIG$signal to PGID: $pgid" | log
	kill -$signal -$pgid
}

kill_group_pgid() {
	local pgid pause pids
	pgid=$1
	pause=$2

	for signal in TERM KILL; do
		# Check if any processes remain
		pids=$(get_pgid_pids $pgid)
		[[ -z "$pids" ]] && return

		# Give processes some time to exit on their own
		[[ -n "$pause" ]] && sleep .5

		kill_pgid $pgid $signal

		for i in 1 2 3 4; do
			# Wait for remaining processes to exit on their own
			sleep .5

			# Check if any processes remain
			pids=$(get_pgid_pids $pgid)
			[[ -z "$pids" ]] && return

			log_remaining_pids $pids
		done
	done
}

log_process_tree_sid() {
	echo "Process tree for SID: $1:" | log
	ps jf -s $1 | log
}

cleanup() {
	echo "Starting cleanup." | log
	log_process_tree_sid $SID
	kill_group_pgid $CHROMIUMOS_UI_PGID pause
	kill_group_pgid $MATCHBOX_WM_PGID
	log_process_tree_sid $SID
	echo "Finished cleanup." | log
}

echo "Starting session." | log

SID=$(ps -o sid= $$ | tr -d ' ')
echo "SID: $SID" | log

matchbox-window-manager -use_titlebar no &
MATCHBOX_WM_PID=$!
MATCHBOX_WM_PGID=$(get_pgid $MATCHBOX_WM_PID)
echo "matchbox-window-manager PID: $MATCHBOX_WM_PID" | log
echo "matchbox-window-manager PGID: $MATCHBOX_WM_PGID" | log

chromiumos-ui "$@" &
CHROMIUMOS_UI_PID=$!
CHROMIUMOS_UI_PGID=$(get_pgid $CHROMIUMOS_UI_PID)
echo "chromiumos-ui PID: $CHROMIUMOS_UI_PID" | log
echo "chromiumos-ui PGID: $CHROMIUMOS_UI_PGID" | log

trap 'cleanup; echo "Ending session." | log' EXIT
wait $CHROMIUMOS_UI_PID
echo "chromiumos-ui exited, exit status: $?" | log
