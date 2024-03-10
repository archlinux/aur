#!/bin/bash
#
# script to create a user-specific environment-file 
# containing variables required by authentication for adguardian
#

ENV_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/adguardian.env"

if [ ! -f $ENV_FILE ] && command -v gum &> /dev/null; then
	if gum confirm "Configure $ENV_FILE with authentication?"; then
		ADGUARD_IP="$(gum input --prompt='ADGUARD_IP: ' --placeholder='192.168.0.1')"
		ADGUARD_PORT="$(gum input --prompt='ADGUARD_PORT: ' --placeholder='80')"
		ADGUARD_USERNAME="$(gum input --prompt='ADGUARD_USERNAME: ' --placeholder='bob')"
		ADGUARD_PASSWORD="$(gum input --prompt='ADGUARD_PASSWORD: ' --placeholder='#$@&%*!' --password)"
		
		echo "export ADGUARD_IP='$ADGUARD_IP'" > $ENV_FILE
		echo "export ADGUARD_PORT='$ADGUARD_PORT'" >> $ENV_FILE
		echo "export ADGUARD_USERNAME='$ADGUARD_USERNAME'" >> $ENV_FILE
		echo "export ADGUARD_PASSWORD='$ADGUARD_PASSWORD'" >> $ENV_FILE

		chmod 600 $ENV_FILE
	elif ! gum confirm "Ask again next time?"; then
		touch $ENV_FILE
	fi
fi

if [ -f $ENV_FILE ]; then
	source $ENV_FILE
fi

/usr/bin/_adguardian "$@"
