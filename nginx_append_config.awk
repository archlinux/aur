#!/usr/bin/awk -f

/^http {/ {
  config_file = "/opt/anki-sync-server/plugins/nginx/config"

	print
	while (getline nextLine && nextLine !~ "^}$") {
		print nextLine
	}

	while ((getline config < config_file)){
		print "\t" config
	}
	close(config)
	print "}"
	next
};

{print}
