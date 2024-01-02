#!/usr/bin/bash -xu
#
# Script job is to check if the sytem's time is as specified time and if it is, then do some downloading and updating. 
# At the end, machine will be powered off by systemd.
#
# Links should be downloaded by download()

LOG='/var/log/midnight-dler.log'
function clock-check() {
	TIME_NOW="$(date +%H%M)"
	if [[ $TIME_NOW > 0200 && $TIME_NOW < 0700 ]]; then #Checks if time is between 2:00 - 4:00. Cause this script should get run only at this time.
		echo 'clock-check success!'
		return 0
	else
		return 1
	fi
}
# Well, script doesn't know the $LINKS and $LINKS_ have been downloaded or not. therefore it rerun the `aria2c` and `yt-dlp` commands.
# Although `aria2c` and `yt-dlp` are smart enough to skip the download if files downloaded correctly.
if [[ $0 -nt $LOG ]]; then # if chores.sh is newer than chores.log, new stuff was added to LINKS or LINKS_.
	SCRIPT_NT_LOG=true
else
	SCRIPT_NT_LOG=false
	echo "Not any new links here for download.\n skipping..." &>>$LOG
fi
function update() {
	/usr/bin/pacman -Syu --noconfirm &>$LOG #will be replaced with `pacman -Syu --no-confirm`. it's just for the examining.
}

function download() {
LINKS=""
LINKS_=""

	DL_DIR="/media/info/Junk" #Directory of downloaded files
	DL_DIR_="/media/info/Junk/DL_DIR_" #Directory of downloaded files

	[[ "$LINKS" ]] && /usr/bin/aria2c -d $DL_DIR -i - -c true &>>$LOG<<<"$LINKS" # || systemctl suspend
	[[ "$LINKS_" ]] && yt-dlp --hls-prefer-native -f best --proxy socks5://127.0.0.1:1080/ -o "${DL_DIR_}/%(title)s.%(ext)s" --no-progress -a - &>>$LOG<<<"$LINKS_" 
}
#clock-check
if clock-check; then
	update
	$SCRIPT_NT_LOG && download
	systemctl poweroff
fi
