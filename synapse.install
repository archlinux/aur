#!/bin/bash

DATA_DIR="/var/lib/synapse"

## arg 1:  the new package version
post_install() {
	systemd-sysusers /usr/lib/sysusers.d/synapse.conf

	if [[ ! -e /etc/synapse/homeserver.yaml ]]; then
		cat <<-EOF
		:: A sample configuration file will be created in /etc/synapse/homeserver.yaml,
		   using /var/lib/synapse as the data directory and localhost:8448 as server name
		   and port. Customize it as necessary or regenerate with the following command:
		   python2.7 -m synapse.app.homeserver --config-path <...> --generate-config
		   (pass --help to see other options).
		EOF

		install -dm700 -o synapse -g synapse "$DATA_DIR"
		cd "$DATA_DIR"
		python2.7 \
			-m synapse.app.homeserver \
			--config-path /etc/synapse/homeserver.yaml \
			--generate-config \
			--server-name localhost \
			--bind-port 8448
	fi
}
