#!/usr/bin/bash

# This script downloads the specified version of FoundryVTT for Linux. The version may be
# specified as just the version, the full package name, or foundryvtt://<package_name>. The
# last form makes this script usable as a DLAGENT for makepkg, so if you would like to opt
# in to interactively being prompted for you foundry credentials when running this PKGBUILD,
# add the following line to ~/.config/pacman/makepkg.conf:
#
#     DLAGENTS+=("foundryvtt::./download_foundry.bash")
#
# This script uses git-credential if available, so that credentials can be saved and reused.

script_name="$(basename "$0")"
if [ ! -t 0 ]; then
	printf '%s must be run interactively.\n' "$script_name"
	exit 1
fi

if [ ${#*} -lt 1 ]; then
	printf 'usage: %s <version|package_name|foundryvtt:://package_name>\n' "$0"
	exit 1
fi

# git-gredential doesn't actually have much to do with Git. Git just exposeses its credential
# helper framework for third party use, and it conveniently integrates with OS password stores.
if { which git && git credential --help; } >/dev/null 2>&1; then
	git_credential_available=1
fi

if [ "$git_credential_available" ]; then
	creds="$(<<<"url=https://foundryvtt.com" git credential fill)"
	username="$(<<<"$creds" sed --quiet 's/^username=//p')"
	password="$(<<<"$creds" sed --quiet 's/^password=//p')"
else
	read -rp "foundryvtt.com username: " username
	read -srp "foundryvtt.com password: " password
	printf '\n'
fi

# foundryvtt.com requires csrftoken cookie and csrfmiddlewaretoken in POST requests to prevent CSRF
cookie_jar="$(mktemp)"
csrfmiddlewaretoken_pat='s/.*<input type="hidden" name="csrfmiddlewaretoken" value="([^"]+)">.*/\1/p'
csrfmiddlewaretoken="$(curl 'https://foundryvtt.com/' --no-progress-meter --cookie-jar "$cookie_jar" \
	| sed --quiet --regexp-extended "$csrfmiddlewaretoken_pat" \
	| head --lines=1)"
curl 'https://foundryvtt.com/auth/login/' \
	--cookie "$cookie_jar" \
	--cookie-jar "$cookie_jar" \
	--referer 'https://foundryvtt.com/' \
	--header 'Origin: https://foundryvtt.com' \
	--data-urlencode "csrfmiddlewaretoken=$csrfmiddlewaretoken" \
	--data-urlencode "next=/" \
	--data-urlencode "username=$username" \
	--data-urlencode "password=$password" \
	--data-urlencode "login="

if [ $? -eq 0 -a "$git_credential_available" ]; then
	<<<"$creds" git credential approve
fi

# Session cookie now in cookie jar, compute and GET download URL
version=$(<<<"$1" sed --regexp-extended \
	--expression='s,foundryvtt://,,' \
	--expression='s/FoundryVTT-Linux-([0-9]+\.[0-9]+)\.zip/\1/')
build_nr=${version#*.}
package_name="FoundryVTT-Linux-$version.zip"
download_url="$(curl "https://foundryvtt.com/releases/download?build=$build_nr&platform=linux" \
	--cookie "$cookie_jar" \
	--location \
	--output "$package_name")"

rm "$cookie_jar"
