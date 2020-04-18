#! /bin/bash
set -e

arg=$1

if [[ "${arg}" == "--init" ]]; then
	echo "Initializing wineprefixe for materialize..."
	echo 'If the initialization failes run "winetricks prefix=materialize-bin annihilate" and rerun "materialize-bin --init"'
	echo ' '
	echo ' '
	winetricks -q prefix=materialize-bin arch=64 vcrun2019 corefonts
	exit 0
elif [[ -z "${arg}" ]]; then
	cd "/opt/materialize-bin"
	WINEPREFIX="$HOME/.local/share/wineprefixes/materialize-bin" wine Materialize.exe
	exit $?
fi

echo "Unexpected argument."
echo "Use --init to initialize the wineprefix or none to start the program."