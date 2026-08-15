#!/usr/bin/bash

# This script downloads the specified version of FoundryVTT for Linux. The version may be
# specified as just the version, the full package name, or foundryvtt://<package_name>. The
# last form makes this script usable as a DLAGENT for makepkg, so if you would like to opt
# in to interactively being prompted for you foundry credentials when running this PKGBUILD,
# add the following line to ~/.config/pacman/makepkg.conf:
#
#     DLAGENTS+=("foundryvtt::./download_foundry.bash")
#
# This script can use the system secret service if available to store password in the Login
# credential store. If you'd like to have makepkg invoke this script and use the save-pawword
# feature, add this line to makepkg.conf instead:
#
#     DLAGENTS+=("foundryvtt::./download_foundry.bash --save-credentials")

script_name="$(basename "$0")"
if [ ! -t 0 ]; then
	printf '%s must be run interactively.\n' "$script_name" 1>&2
	exit 1
fi

# Any unique attribute and value will do
secret_id=(uuid c1ddcf0c-8f4d-4d2b-8475-e4602b04bce3)

case "${1:-}" in
	-s | --save-credentials )
		shift 1
		if which secret-tool >/dev/null 2>&1; then
			use_secret_service=1
		else
			printf "Warning: --save-credentials requested but libsecret not installed\n" 1>&2
		fi
		;;
	-c | --clear-credentials )
		secret-tool clear ${secret_id[@]}
		exit 0
		;;
	-* )
		printf 'Unrecognized option: %s\n' "$1" 1>&2
		exit 1
		;;
esac

if [ ${#*} -lt 1 ]; then
	printf 'usage: %s <version|package_name|foundryvtt:://package_name>\n' "$0" 1>&2
	printf '   or: %s --save-credentials <version|package_name|foundryvtt:://package_name>\n' "$0" 1>&2
	printf '   or: %s --clear-credentials\n' "$0" 1>&2
	printf 'example: %s 13.351\n' "$0" 1>&2
	exit 1
fi

if ! <<<"$1" grep \
	--extended-regexp \
	'(foundryvtt:://)?FoundryVTT-Linux-[0-9]+\.[0-9]+\.zip|[0-9]+\.[0-9]+' \
	>/dev/null 2>&1
then
	printf "%s doesn't look like a FoundryVTT package name or version.\n" "$1" 1>&2
	exit 1
fi

if [ "$use_secret_service" ]; then
	info=$(secret-tool search --unlock ${secret_id[@]} 2>&1)
	username=$(<<<"$info" sed -n 's/^attribute.UserName = //ip')
	password=$(<<<"$info" sed -n 's/^secret = //ip')
fi

if ! [ "$username" -a "$password" ]; then
	new_credentials=1
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
http_code=$(curl 'https://foundryvtt.com/auth/login/' \
	--cookie "$cookie_jar" \
	--cookie-jar "$cookie_jar" \
	--referer 'https://foundryvtt.com/' \
	--header 'Origin: https://foundryvtt.com' \
	--data-urlencode "csrfmiddlewaretoken=$csrfmiddlewaretoken" \
	--data-urlencode "next=/" \
	--data-urlencode "username=$username" \
	--data-urlencode "password=$password" \
	--data-urlencode "login=" \
	--write-out '%{http_code}' \
	--no-progress-meter)

if [ "$http_code" != 302 ]; then
	printf 'Failed to log in to foundryvtt.com.\n' 1>&2
	exit 1
elif [ "$use_secret_service" -a "$new_credentials" ]; then
	printf '%s' "$password" | \
		secret-tool store \
			--label='download_foundry.bash credentials' \
			UserName "${username}" \
			${secret_id[@]} \
			2>/dev/null
fi

# Session cookie now in cookie jar, compute and GET download URL
version=$(<<<"$1" sed --regexp-extended \
	--expression='s,foundryvtt://,,' \
	--expression='s/FoundryVTT-Linux-([0-9]+\.[0-9]+)\.zip/\1/')
build_nr=${version#*.}
package_name="FoundryVTT-Linux-$version.zip"
curl "https://foundryvtt.com/releases/download?build=$build_nr&platform=linux" \
	--cookie "$cookie_jar" \
	--location \
	--output "$package_name" \
	--fail

rm "$cookie_jar"
