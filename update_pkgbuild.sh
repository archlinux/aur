#!/bin/bash

readonly PROGRAM_NAME=$(basename $0)

usage() {
	cat << EOF
Update PKGBUILD

Usage: ${PROGRAM_NAME} [options]

Options:
	-h, --help 		display this help message and exit.
	-r, --pkgrel 		the package version
	-v, --pkgver 		the package release
EOF
}

main() {
	pkgver=""
	pkgrel=""

	optspec=":hr:v:-:"
	while getopts "$optspec" optchar; do
		case "${optchar}" in
			-)
				case "${OPTARG}" in
					help)
						usage
						exit 2
						;;
					pkgver)
						pkgver="${!OPTIND}";
						OPTIND=$(( $OPTIND + 1 ))
						;;
					pkgrel)
						pkgrel="${!OPTIND}";
						OPTIND=$(( $OPTIND + 1 ))
						;;
					*)
						echo "Unknown option --${OPTARG}" >&2
						exit 1
						;;
				esac;;
			h)
				usage
				exit 2
				;;
			r)
				pkgrel="${OPTARG}"
				;;
			v)
				pkgver="${OPTARG}"
				;;
			*)
				echo "Non-option argument: '-${OPTARG}'" >&2
				exit 1
				;;
		esac
	done

	if [ -z "${pkgver}" ]; then
		echo "You must specify the package version!"
		echo "Exiting..."
		exit 1
	fi
	sed -i -r "s/^pkgver=([0-9]{1,2}\.[0-9]{1,2}\.[0-9]{1,3})$/pkgver=${pkgver}/g" PKGBUILD

	if [ -z "${pkgrel}" ]; then
		pkgrel=$(grep "^pkgrel" PKGBUILD | cut -d '=' -f 2)
	fi
	sed -i -r "s/^pkgrel=([0-9])$/pkgrel=${pkgrel}/g" PKGBUILD

	algorithm="sha512"
	checksum_file="Joplin-${pkgver}.AppImage.${algorithm}"
	repo_url="https://github.com/laurent22/joplin/releases/download/v${pkgver}/${checksum_file}"

	status=$(curl --output /dev/null -I --write-out '%{http_code}' "${repo_url}")
	# requests are always redirected to the aws servers
	if [[ "302" != "${status}" ]]; then
		echo "The file ${checksum_file} does not exists!"
		echo "Exiting..."
		exit 1
	fi

	sha512=$(curl --silent -L "${repo_url}")
	sed -i -r "s/^\s\s([A-Fa-f0-9]{128})$/  ${sha512}/g" PKGBUILD
	if [ $? -ne 0 ]; then
		echo "Failed to update sha512!"
		echo "Need manual intervention!"
		exit 1
	fi
}

main $@
