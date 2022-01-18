#!/usr/bin/awk -f

/^http {/ {
	print

	while (getline nextLine && nextLine !~ "^}$") {
		print nextLine
	}

  print "include /etc/nginx/sites-enabled/*";
	print "}"
	next
};

{print}
