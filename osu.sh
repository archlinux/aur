#!/bin/sh
export XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
export WINEDEBUG="${WINEDEBUG--all}"
export WINEPREFIX="${WINEPREFIX-${XDG_DATA_HOME}/wineprefixes/osu-stable}"
export WINEARCH='win32'
export OSU_STABLE_DATA_DIRECTORY="${OSU_STABLE_DATA_DIRECTORY-${XDG_DATA_HOME}/osu-stable}"

if [ ! -d "${WINEPREFIX}" ]; then
	echo 'Setting up the Wine prefix...'
	winetricks -q 'dotnet40' 'cjkfonts'
	echo 'Completed setting up the Wine prefix.'
fi

if [ ! -d "${OSU_STABLE_DATA_DIRECTORY}" ]; then
	echo 'Installing osu!stable...'
	mkdir -p "${OSU_STABLE_DATA_DIRECTORY}"
	cp '/usr/share/osu/osu-stable-installer.exe' "${OSU_STABLE_DATA_DIRECTORY}"
	wine "${OSU_STABLE_DATA_DIRECTORY}/osu-stable-installer.exe"
	echo 'Completed installing osu!stable.'
	exit
fi

case "$1" in
	'kill')
		wineserver -k
		;;
	'winetricks')
		shift 1
		winetricks "$@"
		;;
	'wine')
		shift 1
		wine "$@"
		;;
	'')
		env vblank_mode=0 __GL_SYNC_TO_VBLANK=0 wine "${OSU_STABLE_DATA_DIRECTORY}/osu!.exe" "$@"
		;;
	*)
		echo 'Usage:'
		printf '%s\t\t\tRun the game\n' "$(basename "$0")"
		printf '%s kill\t\t\tKill the game\n' "$(basename "$0")"
		printf '%s wine [command]\tExecute Wine command on the Wine prefix (winecfg, regedit, ...)\n' "$(basename "$0")"
		printf '%s winetricks [command]\tExecute Winetricks command on the Wine prefix\n' "$(basename "$0")"
		;;
esac
