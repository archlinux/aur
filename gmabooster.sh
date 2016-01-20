#!/bin/bash

# Contributor: Chris Down <cdown.uk@gmail.com>

# Wrapper for gmabooster to prompt that it should be run as root

# We don't want to simply block root or check for the existence of su/sudo,
# as the user might be running in a fakeroot environment, etc...
# (and even if we aren't root, let's assume the user knows what they're doing)

if [[ "${EUID}" -eq 0 ]]; then
	/opt/GMABooster/GMABooster "$@"
	# Store it in a variable so we can exit with the same return code
	gbexit="$?"
else
	echo "GMABooster should be run as root to function properly."
		
	while true; do
		read -p "Do you wish to continue anyway? (y/n): " DOCONT
		case "${DOCONT}" in
			y|Y)
				/opt/GMABooster/GMABooster "$@"
				exit "$?"
				;;
			n|N) exit "126" ;;
			*) echo "Please enter y or n." ;;
		esac
	done
fi
	
# Exit with the same return code as gmabooster
# (We shouldn't ever get down to here... but just in case)
exit "${gbexit-127}"
