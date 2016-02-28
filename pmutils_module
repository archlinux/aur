#!/bin/sh

export TUXONICE_LOC
# TODO tuxonice supports all sorts of knobs to twiddle. Since this should be as
# simple as possible, it does not provide a mechanism for twiddling those knobs.
# If you need more customization than this file has, consider using a hook to
# set the appropriate values.

# more locations might be nice
for loc in "/sys/power/tuxonice" "/sys/power/suspend2"; do
	[ -d "${loc}" ] && { TUXONICE_LOC="${loc}"; break; }
done

if [ -n "$TUXONICE_LOC" ]; then
    toi_maybe_chvt() {
	local toi_ui="$(cat "$TUXONICE_LOC/user_interface/program")"
	local toi_ui_en="$(cat "$TUXONICE_LOC/user_interface/enabled")"
	if [ -x "$toi_ui" ] && [ "$toi_ui_en" = 1 ] && \
	    ! state_exists console; then
	    fgconsole |savestate console
	    chvt 63
	fi
    }
fi

if [ -z "$HIBERNATE_MODULE" -a -n "$TUXONICE_LOC" ] && \
	[ -f "${TUXONICE_LOC}/do_hibernate" ]; then
	HIBERNATE_MODULE="tuxonice"
	do_hibernate()
	{
	    toi_maybe_chvt
	    echo 5 > "${TUXONICE_LOC}/powerdown_method"
      /usr/sbin/hibernate
	}
fi

if [ -z "$SUSPEND_HYBRID_MODULE" -a -n "$TUXONICE_LOC" ] && \
	grep -q mem /sys/power/state && \
	[ -f "${TUXONICE_LOC}/do_hibernate" ]; then
	SUSPEND_HYBRID_MODULE="tuxonice"
	do_suspend_hybrid()
	{
	    toi_maybe_chvt
	    r=0
	    echo 3 >"${TUXONICE_LOC}/powerdown_method"
      /usr/sbin/hibernate
	    r=$?
	    [ -f /sys/power/tuxonice/did_suspend_to_both ] && \
	    	[ "$(cat /sys/power/tuxonice/did_suspend_to_both)" != "1" ] && \
	    	REVERSE="thaw"
	    return $r
	}
fi
