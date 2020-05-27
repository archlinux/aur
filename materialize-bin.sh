#! /bin/bash

pkgname="materialize-bin"
pkgexec="Materialize.exe"
pkgdir="/opt/${pkgname}"
pkguser="${HOME}/.${pkgname}"

arg=$1

if [[ "${arg}" == "--init" ]]; then
	
	echo "Initializing local symlink directory..."
	mkdir --parents --verbose "${pkguser}"
	find -L "${pkguser}" -type l -delete
	cp --update --recursive --symbolic-link --verbose "${pkgdir}/"* "${pkguser}/"

	echo "Initializing wineprefixe for materialize..."
	winetricks -q prefix=${pkgname} arch=64 win10 dxvk170 vcrun2019 corefonts
	if [[ $? -ne 0 ]]; then
		echo 'The initialization failed. Try running "materialize-bin --annihilate" and rerun "materialize-bin --init".'
		exit 1
	fi

	exit 0

elif [[ "${arg}" == "--annihilate" ]]; then

	winetricks -q prefix=${pkgname} annihilate
	exit $?

elif [[ -z "${arg}" ]]; then

	WINEPREFIX="$HOME/.local/share/wineprefixes/materialize-bin" wine "${pkguser}/${pkgexec}"
	code=$?
	if [[ ${code} -ne 0 ]]; then
		echo 'The program returned an exit code not equal to 0. Did you already run "materialize-bin --init"?'
	fi
	exit ${code}

fi

echo "Unexpected argument: ${arg}"
echo " "
echo "Options: "
echo "                          Without options the main program is launched."
echo "          --init          Initializes the wineprefix for this program."
echo "          --annihilate    Annihilates the wineprefix for this program."
