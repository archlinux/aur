
#  /etc/rc.d/functions.d/fbsplash-basic.sh                                   #

#  Basic Fbsplash script for Arch Linux initscripts                          #
#                                                                            #
#  Author:                Kurt J. Bosch    <kjb-temp-2009 at alpenjodel.de>  #
#  Based on the work of   Greg Helton                <gt at fallendusk.org>  #
#                         Thomas Baechler         <thomas at archlinux.org>  #
#                         and others                                         #
#                                                                            #
#  Distributed under the terms of the GNU General Public License (GPL)       #

[[ $PREVLEVEL && $RUNLEVEL ]] || return 0

# Do nothing if advanced script is installed
[[ -r /etc/rc.d/functions.d/fbsplash-extras.sh ]] && return

# Only do this where needed
# Since we use BASH, all important functions and variables are exported
case ${0#/etc/rc.} in sysinit | multi | shutdown )
	# splash-functions.sh will run splash_setup which needs /proc
	# code line copied from /etc/rc.sysinit
	/bin/mountpoint -q /proc || /bin/mount -n -t proc proc /proc -o nosuid,noexec,nodev
	export SPLASH_PUSH_MESSAGES SPLASH_VERBOSE_ON_ERRORS
	. /usr/bin/splash-functions.sh # /etc/conf.d/splash is also sourced by this
	unset options opt i # eliminate splash_setup non local vars   ## FIX ME ##
	SPLASH_STEPS=3 # sysinit steps
	SPLASH_STEPS_DONE=0
esac

# Verbose mode is handled by fbcondecor kernel patch and daemon script
[[ $SPLASH_MODE_REQ = silent ]] || return 0

# Override - Don't try to use /usr/bin/basename
splash_comm_send() {
	[[ $( /bin/pidof -o %PPID $spl_daemon ) ]] && echo "$@" >$spl_fifo &
}

case $0 in /etc/rc.sysinit )
	# Prevent splash destruction
	CONSOLEFONT=""
	# Continue to use a splash daamon started in initcpio
	if /bin/mountpoint -q /run/.splash-cache; then
		/bin/mount --move /run/.splash-cache $spl_cachedir || return
		splash_comm_send set message "$SPLASH_BOOT_MESSAGE"
	# Mount a tmpfs
	else
		( splash_cache_prep ) || return
	fi
	add_hook sysinit_udevsettled  splash_sysinit_udevsettled
	add_hook sysinit_postfsck     splash_sysinit_postfsck
	add_hook sysinit_postfsckloop splash_sysinit_postfsck
	add_hook sysinit_premount     splash_sysinit_premount
	add_hook sysinit_end          splash_sysinit_end
	splash_sysinit_udevsettled() {
		splash_begin
		splash_progress_init
		splash_progress
	}
	splash_sysinit_premount() {
		splash_progress
	}
	splash_sysinit_postfsck() { # fsck failure emergency exit
		(( fsckret > 1 && fsckret != 32 )) && chvt 1
	}
	splash_sysinit_end() {
		splash_progress
	}
;; /etc/rc.multi )
	add_hook multi_start splash_multi_start
	add_hook multi_end   splash_multi_end
	splash_multi_start() {
		SPLASH_STEPS_DONE=$SPLASH_STEPS
		splash_progress_init
	}
	start_daemon() {
		[[ $1 = $SPLASH_XSERVICE ]] && SPLASH_EXIT_TYPE=staysilent splash_stop
		/etc/rc.d/$1 start
		splash_progress
	}
	start_daemon_bkgd() {
		[[ $1 = $SPLASH_XSERVICE ]] && SPLASH_EXIT_TYPE=staysilent splash_stop
		stat_bkgd "Starting $1"
		( SPLASH_PUSH_MESSAGES="no" SPLASH_VERBOSE_ON_ERRORS="no" \
			/etc/rc.d/$1 start ) &>/dev/null &
	}
	splash_multi_end() {
		if [[ $PREVLEVEL = N ]]; then
			if ! in_array "$SPLASH_XSERVICE" "${DAEMONS[@]}"; then
				if [[ $RUNLEVEL = 5 ]]; then
					SPLASH_EXIT_TYPE=staysilent splash_stop
				else
					splash_stop
					[[ $( $spl_bindir/fgconsole ) = $SPLASH_TTY ]] && chvt 1
				fi
			fi
			# Now do setfont
			/usr/lib/systemd/systemd-vconsole-setup
			# Umount the tmpfs
			splash_cache_cleanup
		fi
	}
;; /etc/rc.shutdown )
	( splash_cache_prep ) || return
	# Not using XSERVICE here to avoid missing errors - X should chvt back to SPLASH_TTY
	add_hook shutdown_start       splash_shutdown_start
	add_hook shutdown_prekillall  splash_shutdown_prekillall
	add_hook shutdown_postkillall splash_shutdown_postkillall
	add_hook shutdown_poweroff    splash_shutdown_poweroff
	splash_shutdown_start() {
		splash_begin
	}
	splash_shutdown_prekillall() {
		splash_comm_send progress $(( 65535*1/3 )); splash_comm_send paint
		[[ -r $spl_pidfile ]] && add_omit_pids $( <$spl_pidfile )
	}
	splash_shutdown_postkillall() {
		splash_comm_send progress $(( 65535*2/3 )); splash_comm_send paint
	}
	splash_shutdown_poweroff() {
		SPLASH_EXIT_TYPE=staysilent splash_stop
	}
esac

splash_progress_init() {
	for daemon in "${DAEMONS[@]}"; do
		case $daemon in $SPLASH_XSERVICE | @$SPLASH_XSERVICE ) break
		;; \!* |@* ) continue
		esac
		(( SPLASH_STEPS++ ))
	done
}

splash_progress() {
	splash_comm_send progress $(( 65535*++SPLASH_STEPS_DONE/SPLASH_STEPS ))
	splash_comm_send paint
}

# Start the splash daemon - using upstream function
splash_begin() {
	if ! [[ $( /bin/pidof -o %PPID $spl_daemon ) ]]; then
		stat_busy "Starting Fbsplash daemon"
		if [ -x /etc/splash/$SPLASH_THEME/scripts/rc_init-pre ]; then
			/etc/splash/$SPLASH_THEME/scripts/rc_init-pre ${0#/etc/rc.d} $RUNLEVEL
		fi &&
		splash_start &&
		stat_done || stat_fail
	fi
}

# Stop the splash daemon - if any
splash_stop() {
	if [[ $( /bin/pidof -o %PPID $spl_daemon ) ]]; then
		SPLASH_PUSH_MESSAGES="no" stat_busy "Stopping Fbsplash daemon"
		splash_comm_send progress 65535; splash_comm_send paint; /usr/bin/sleep .1
		splash_comm_send exit $SPLASH_EXIT_TYPE
		# Wait for painting/fadeout
		local -i i=0
		while [[ i++ -lt 100 && $( /bin/pidof -o %PPID $spl_daemon ) ]]; do
			/usr/bin/sleep .1
		done
		stat_done
	fi
}

stat_busy() {
	printf "${C_OTHER}${PREFIX_REG} ${C_MAIN}${1}${C_CLEAR} "
	printf "${SAVE_POSITION}"
	deltext
	printf "   ${C_OTHER}[${C_BUSY}BUSY${C_OTHER}]${C_CLEAR} "
	SPLASH_BUSY_MSG=$1
	if [[ $SPLASH_PUSH_MESSAGES = yes ]]; then
		splash_comm_send set message "${1}"
		splash_comm_send paint
	fi
}

stat_fail() {
	deltext
	printf "   ${C_OTHER}[${C_FAIL}FAIL${C_OTHER}]${C_CLEAR} \n"
	local event=stop_failed; [[ $PREVLEVEL = N ]] && event=start_failed
	# Provide a general failure status event and write to msglog textbox
	splash_comm_send update_svc fbsplash-dummy svc_${event}
	splash_comm_send log "Error $SPLASH_BUSY_MSG"
	splash_comm_send paint
	# Save for daemon restart                                     ## FIX ME ##
	if /bin/mountpoint -q $spl_cachedir; then
		: >|$spl_cachedir/${event}-fbsplash-dummy
	fi
	# Upstream way of error handling
	if [[ $SPLASH_VERBOSE_ON_ERRORS = yes ]]; then
		chvt 1
	fi
}

# EOF #
