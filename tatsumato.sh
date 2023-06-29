#!/bin/bash
#
# Tatsumato - Tatsumoto's Pomodoro timer.
#
# Copyright (C) 2020-2023 Ren Tatsumoto
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

readonly lock_timeout=10s
readonly lock_color=111111

while getopts 'a p H v h s i d    t: b: l: L: k:' flag; do
	case $flag in
	H) human=false ;;
	v) verbose=true ;;
	h) disphelp=true ;;
	s) silent=true ;;
	i) use_i3lock=true ;;
	p) control_player=true ;;
	a) control_anki=true ;;
	d) dmenu_nag=true ;;

	t) pomtime=${OPTARG} ;;
	b) brktime=${OPTARG} ;;
	l) lngbrkt=${OPTARG} ;;
	L) longbrk=${OPTARG} ;;
	k) endtime=${OPTARG} ;;
	*) echo "Unknown argument ${flag}" && exit 1 ;;
	esac
done

readonly human=${human:-true}
readonly verbose=${verbose:-false}
readonly disphelp=${disphelp:-false}
readonly silent=${silent:-false}
readonly use_i3lock=${use_i3lock:-false}
readonly control_player=${control_player:-false}
readonly control_anki=${control_anki:-false}
readonly dmenu_nag=${dmenu_nag:-false}

readonly pomtime=${pomtime:-25}
readonly brktime=${brktime:-5}
readonly lngbrkt=${lngbrkt:-10}
readonly longbrk=${longbrk:-3}
readonly endtime=${endtime:-0}

show_help() {
	local -r prog=$(basename -- "$0")
	cat <<-END
		$prog - Pomodoro productivity shell script.

		Options:
	END
	column -N key,description -W description -d -t -s'|' <<-'EOF'
		  -t [minutes]|Set the amount of minutes a pomodoro lasts. Default 25.
		  -b [minutes]|Set the amount of minutes a short break lasts. Default 5.
		  -l [minutes]|Set the amount of minutes a long break lasts. Default 10.
		  -L [number]|Set the amount of pomodoros before triggering a long break. Default 3.
		  -k [number]|Set the amount of pomodoros before ending the script. 0 means the script will run until stopped by the user. Default 0.
		  -H|Disable human mode.
		  -h|Display this help text and exit.
		  -v|Enable verbose mode. Echo the pomodoro status to your terminal. Off by default.
		  -s|Silent mode. Notification sound is not played.
		  -i|Run i3lock when a pomodoro is over.
		  -p|Pause/unpause mpv between breaks.
		  -a|Control Anki. Close Anki's review screen before a break starts.
		  -d|Show a dmenu (or rofi) dialog after each pomodoro.
	EOF
	cat <<-END

		Notes:
		  Create a shell alias with the options you like. For example:
		  alias pom="$prog -a -i -p -t 13 -b 2 -l 3"
	END
}

assert_installed() {
	local x
	for x; do
		if ! command -v "$x" >/dev/null 2>&1; then
			echo "Error: $x is not installed." >&2
			exit 1
		fi
	done
}

play_bell() {
	assert_installed paplay
	paplay /usr/share/sounds/freedesktop/stereo/complete.oga &
}

notify() {
	assert_installed notify-send
	$verbose && echo "$@"
	notify-send "Pomodoro" "$*" >/dev/null 2>&1 &
	$silent || play_bell
}

do_pomodoro() {
	local -r time=$1 mode=$2
	for ((i = time; i > 0; i--)); do
		$human && printf -- '\r'
		printf -- '%im left of %s ' "$i" "${mode,,}"
		$human || printf -- '\n'
		sleep 1m
	done
}

close_review_window() {
	assert_installed curl
	# If you use Pomodoro while doing your Anki reps,
	# this function will close the review window before a break starts.
	# Requires AnkiConnect to work.
	curl \
		-s 'localhost:8765' \
		-X POST \
		-d '{ "action": "guiDeckBrowser", "version": 6 }' >/dev/null &
}

setallmpv() {
	# Sends pause/play commands to mpv.
	# Requires the mpvSockets user-script for mpv.
	assert_installed socat i3-msg

	local cmd='{ "command": ["set_property", "pause", <pause>] }'

	if [[ $1 == play ]]; then
		local -r cmd=${cmd/<pause>/false}
		i3-msg -q '[class="mpv"] focus' || true
	else
		local -r cmd=${cmd/<pause>/true}
	fi

	for i in /tmp/mpvSockets/*; do
		echo "$cmd" | socat - "$i"
	done
}

resume_player() {
	setallmpv play >/dev/null 2>&1
}

pause_player() {
	setallmpv pause >/dev/null 2>&1
}

lock_screen() {
	assert_installed i3lock
	(
		sleep "$lock_timeout"
		i3lock --color="$lock_color"
	) &
}

unlock_screen() {
	killall i3lock 2>/dev/null || true
}

call_dmenu() {
	if command -v rofi >/dev/null; then
		rofi -dmenu "$@"
	else
		assert_installed dmenu
		dmenu "$@"
	fi
}

dmenu_report() {
	cat <<-EOF | call_dmenu -l 30 -i -p "Finished 🍠$pomcount pomodoros."
		☕ start ${mode,,} ($time min)
		🚪 exit
	EOF
}

dmenu_nagscreen() {
	$silent || play_bell
	case $(dmenu_report) in
	*start*) return ;;
	*exit) exit ;;
	*) echo "Invalid command or no command provided." && exit 1 ;;
	esac
}

main() {
	$disphelp && show_help && exit

	local endcount=0 pomcount=0 mode=Pomodoro time=$pomtime

	while true; do
		notify "${mode^} will last for $time minute(s)."
		do_pomodoro "$time" "$mode"

		if [[ ${mode,,} == "pomodoro" ]]; then
			# after pomodoro
			pomcount=$((pomcount + 1)) endcount=$((endcount + 1))
			if [[ $endtime -gt 0 ]] && [[ $endcount -ge $endtime ]]; then
				echo "Finished."
				return
			fi
			if [[ $pomcount -eq $longbrk ]]; then
				mode="Long break" time=$lngbrkt
			else
				mode="Short break" time=$brktime
			fi
			$dmenu_nag && dmenu_nagscreen
			$control_player && resume_player
			$use_i3lock && lock_screen
			$control_anki && close_review_window
		else
			# after break
			mode="Pomodoro" time=$pomtime
			$use_i3lock && unlock_screen
			$control_player && pause_player
			$dmenu_nag && dmenu_nagscreen
		fi

		if [[ ${mode,,} == "long break" ]]; then
			pomcount=0
		fi
	done
}

main
