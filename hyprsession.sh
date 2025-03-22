helpl="
				hyprsession.sh version 1.0
				==========================
    Usage
    -----
	hyprsession.sh [action] <path>
	hyprsession.sh option [option] <value>

    Parameters
    ----------
	[action]
	 >> shutdown		Save a session and shutdown the system
	 >> reboot		Save a session and reboot the system
	 >> save		Save a session
	 >> load		Load a session
	 >> boot		Load a session and loop, saving periodically
	 >> run			Loop and save periodically

	<path>			Defines an optional path that
				 hyprsession will use as a session
	
	[option]
	 >> autosave		Save a session automatically (60; seconds)
	 >> path		Define the default path for hyprsession
				 to use (~/.config/hypr/hypr.session; string)
	
	<value>			Defines the value that an option is set to
"


IFS=$'\n'
autosave=60
path=~/.config/hypr/hypr.session
if [ -f ~/.config/hypr/hyprsession.conf ]; then
	config=$(<~/.config/hypr/hyprsession.conf)
	parameter=""
	for line in $config; do
		if	[[ $line =~ ^autosave: ]];	then
			autosave=${line:10}
		elif	[[ $line =~ ^path: ]];		then
			path=${line:6}
		fi
	done
else
	echo "autosave: $autosave
path: $path">~/.config/hypr/hyprsession.conf
fi


save() {
	monitor=""
	workspace=""
	move=""
	size=""
	pin=""
	float=""
	fullscreen=""
	clientfullscreen=""
	run=""
	>$(eval echo $path)
	for line in $(hyprctl clients); do
		if [[ $line =~ ^Window ]] && [[ $run != "" ]]; then
			echo "[$monitor;$workspace;$move;$size;$pin;$float;$fullscreen;$clientfullscreen] $run">>$(eval echo $path)
			monitor=""
			workspace=""
			move=""
			size=""
			pin=""
			float=""
			fullscreen=""
			clientfullscreen=""
			run=""
		else
			value=$(echo $line | xargs)
			if	[[ $value =~ ^monitor: ]];		then
				monitor="monitor${value:8}"
			elif	[[ $value =~ ^workspace: ]];		then
				preworkspace=${value:10}
				workspace="workspace${preworkspace%%(*}silent"
			elif	[[ $value =~ ^at: ]];			then
				move="move${value:3}"
			elif	[[ $value =~ ^size: ]];			then
				size="size${value:5}"
			elif	[[ $value == "pinned: 1" ]];		then
				pin="pin"
			elif	[[ $value == "floating: 1" ]];		then
				float="float"
			elif	[[ $value == "fullscreen: 1" ]];	then
				fullscreen="fullscreen"
			elif	[[ $value == "fullscreenClient: 1" ]];	then
				clientfullscreen="fakefullscreen"
			elif	[[ $value =~ ^pid: ]];			then
				run=$(ps --no-headers -o cmd -p ${value:5})
			fi
		fi
	done
	echo "[$monitor;$workspace;$move;$size;$pin;$float;$fullscreen;$clientfullscreen] $run">>$(eval echo $path)

}


if	[[ $1 == "option" ]];			then
	if	[[ $2 == "autosave" ]];		then
		autosave=$3
	elif	[[ $2 == "path" ]];		then
		path=$3
	fi
	echo "autosave: $autosave
path: $path">~/.config/hypr/hyprsession.conf
	exit 0
else
	if	[[ $2 != "" ]];			then
		if [ -f $2 ];			then
			if	[[ ! $2  =~ .session$ ]];		then
				echo "Warning: the path provided is not a .session, make sure you passed in a valid session file!"
			fi
			path=$2
		else
			echo "Error: the file you provided does not exist."
			exit 1
		fi
	fi
fi

if	[[ $1 == "save" || $1 == "reboot" || $1 == "shutdown" ]];	then
	save
	if	[[ $1 == "reboot" ]];		then
		reboot
	elif	[[ $1 == "shutdown" ]];		then
		shutdown
	fi
	exit 0
fi

if	[[ $1 == "load" || $1 == "run" || $1 == "boot" ]];		then
	if	[[ $1 != "run" ]];		then
		for line in $(cat $(eval echo $path)); do
			IFS=$' '
			hyprctl dispatch -- exec $line
		done
	fi
	if	[[ $1 != "boot" ]];		then
		while true; do
			sleep $autosave
			save
		done
	fi
	exit 0
fi

#elif	[[ $1 == "hardload" ]];	then
#	pids=""
#	for line in $(hyprctl clients); do
#		value=$(echo $line | xargs)
#		if	[[ $value =~ ^pid: ]];	then
#			if [[ ${value:5} != "$$" ]]; then
#				pids="$pids ${value:5}"
#			fi
#		fi
#	done
#
#	dispatch=""
#	for line in $(cat $(eval echo $path)); do
#		IFS=' '
#		dispatch="$dispatch & hyprctl dispatch exec \"$line\""
#	done
#	IFS=$' \t\n'
#	kill$pids$dispatch & disown

printf "%s\n" "$helpl"
