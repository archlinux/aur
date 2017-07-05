#!/usr/bin/env bash
#
# Copyright (C) 2009 Benjamin Drung <bdrung at ubuntu dot com>
# Copyright (C) 2012 Alessio Sergi <al3hex at gmail dot com>
# modified 2012 for tor-browser (Max Roder <maxroder at web dot de>)
# modified 2014 by Yardena Cohen <yardenack at gmail dot com>
# modified 2017 by grufo <madmurphy333 at gmail dot com>
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
# along with this program. If not, see <http://www.gnu.org/licenses/>.

set -e

# filled by the PKGBUILD
TB_PKGNAME='REPL_NAME'
TB_VERSION='REPL_VERSION'
TB_RELEASE='REPL_RELEASE'
TB_LANGUAGE="REPL_LANGUAGE"

ARCH=$(getconf LONG_BIT)

notify() {
	local title="${1}"
	local message="${2}"

	if [ $(which zenity 2>/dev/null) ]; then
		zenity --info --title "${title}" --text "${message}"
	elif [ $(which notify-send 2>/dev/null) ]; then
		notify-send "${title}" "${message}"
	elif [ $(which kdialog 2>/dev/null) ]; then
		kdialog --title "${title}" --passivepopup "${message}"
	else
		echo -e "${0}: [${title}] ${message}" >&2
	fi
}

compare_versions() {
	[ "${1}" = "${2}" ] && return 1 || [ "${1}" = "`echo -e "${1}\n${2}" | sort -V | head -n1`" ]
}

update() {
	echo "${0}: Extracting files to ${TB_APP_DIR}." >> "${TB_LOG_FILE}"
	rm -rf "${TB_APP_DIR}"/*
	tar --strip-components=1 -xJf "/opt/${TB_PKGNAME}/tor-browser-linux${ARCH}-${TB_VERSION}_${TB_LANGUAGE}.tar.xz" \
		-C "${TB_APP_DIR}" >> "${TB_LOG_FILE}" 2>&1 || notify "Error" \
		"The tor-browser archive could not be extracted to your home directory. \
		\nCheck permissions of ${TB_APP_DIR}. \
		\nThe error log can be found in ${TB_LOG_FILE}."

	[[ -f "${TB_APP_DIR}/Browser/start-tor-browser" ]] && echo "${TB_VERSION}" > "${TB_VER_FILE}"
}

aur_update() {

	local DO_UPDATE='0'
	local TMP_PKGBUILD="$(mktemp -d)"

	if [ "$(id -u)" == '0' ]; then
		echo 'It is not a good idea to do this as root. Abort.' 1>&2
		exit 1
	fi

	cd "${TMP_PKGBUILD}"

	curl --silent "https://aur.archlinux.org/cgit/aur.git/snapshot/${TB_PKGNAME}.tar.gz" | tar xz

	cd "${TMP_PKGBUILD}/${TB_PKGNAME}"

	local NEW_VERSION="$(grep 'pkgver' '.SRCINFO' | cut -d = -f2 | sed -e 's/^[[:space:]]*//')"
	local NEW_RELEASE="$(grep 'pkgrel' '.SRCINFO' | cut -d = -f2 | sed -e 's/^[[:space:]]*//')"

	if compare_versions ${TB_VERSION} ${NEW_VERSION}; then
		echo 'Found new version.'
		local DO_UPDATE='1'
	elif [ "${TB_VERSION}" == "${NEW_VERSION}" ] && [ "${TB_RELEASE}" != "${NEW_RELEASE}" ] && [ "${TB_RELEASE}" = "`echo -e "${TB_RELEASE}\n${NEW_RELEASE}" | sort | head -n1`" ]; then
		echo 'Found new PKGBUILD release.'
		local DO_UPDATE='1'
	else
		echo 'Everything is up to date'
	fi

	[ "${DO_UPDATE}" == '1' ] && makepkg -si

	rm -rf "${TMP_PKGBUILD}"

}

usage() {
	cat <<EOF
Usage: ${0##*/} [option]

Options:
  -h|--help         Show this help message and exit
  -a|--aurupdate    Search for a new release on Arch User Repository (AUR) and install it
  -u|--update       Force update of the copy in your home directory
  --dir=<directory> The Tor-Browser directory to use

  All unrecognized arguments will be passed to the browser.
EOF
}

DIRECTORY=~/.${TB_PKGNAME}

# remove old INSTALL directory (temporary command to be removed in the next versions)
if [ -d "${DIRECTORY}/INSTALL" ]; then
	rm -rf "${DIRECTORY}"
fi

args=()
for arg; do
	case "${arg}" in
		-h|--help) usage; exit 0 ;;
		-a|--aurupdate) aur_update; exit 0 ;;
		-u|--update) update=1 ;;
		--dir=*) DIRECTORY="${arg#*=}" ;;
		*) args+=("$arg") ;;
	esac
done

TB_APP_DIR="${DIRECTORY}/APP"
TB_VER_FILE="${DIRECTORY}/VERSION"
TB_LOG_FILE="${DIRECTORY}/LOG"

# create directory, if it is missing (e.g. first run)
[[ ! -d "${TB_APP_DIR}" ]] && mkdir -p "${TB_APP_DIR}"
cd "${DIRECTORY}"

# create version file if missing
[[ ! -f "${TB_VER_FILE}" ]] && echo 0 > "${TB_VER_FILE}"

# get installed version
while read line
do
	TB_INSTALLED_VERSION="${line}"
done < ${TB_VER_FILE}

# start update if old or no tor-browser is installed
if [[ "${TB_INSTALLED_VERSION}" == "${TB_VERSION}" ]] && [[ ${update} != 1 ]]; then
	# clear log
	> "${TB_LOG_FILE}"
else
	echo "${0}: Your version in ${DIRECTORY} is outdated or you do not have installed ${TB_PKGNAME} yet." > "${TB_LOG_FILE}"
	update
fi

# start tor-browser
cd "${TB_APP_DIR}/Browser" && ./start-tor-browser "${args[@]}"
