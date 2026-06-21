#!/usr/bin/env bash

set -euo pipefail

readonly all_off="$(tput sgr0)"
readonly bold="${all_off}$(tput bold)"
readonly white="${bold}$(tput setaf 7)"
readonly blue="${bold}$(tput setaf 4)"
readonly red="${bold}$(tput setaf 1)"

msg() {
	printf "${blue}::${white} $1${all_off}\n"
}

error() {
	printf "${red}::${white} $1${all_off}\n"
}

msgbegin() {
	printf "${blue}::${white} $1"
}

msgend() {
	printf "$1${all_off}\n"
}


# head to directory of this script
cd $(dirname "$0")

msgbegin "Checking for latest version… "
readonly latest_version="$(curl -s "https://discord.com/api/updates/stable?platform=linux" | jq -r .name)"
sed -E -i "s/pkgver=.*/pkgver=${latest_version}/;s/pkgrel=.*/pkgrel=1/" PKGBUILD
msgend "Found ${latest_version}"

msg "Running updpkgsums (Updating checksums)"
updpkgsums

msg "Running mksrcinfo (Updating SRCINFO file)"
makepkg --printsrcinfo > .SRCINFO
