basename=slk-eng
pkgname=dict-freedict-$basename
dictd_conf=/etc/dict/dictd.conf
datadir=/usr/share/dictd
conf="database $basename {
	data $datadir/$basename.dict.dz
	index $datadir/$basename.index
}"

post_install()
{
	echo
	if pacman -Qq dictd > /dev/null 2>&1
	then
		if grep -q "^database *$basename" "$dictd_conf"
		then
			echo "$pkgname already configured in $dictd_conf"
		else
			echo "Adding configuration for $pkgname to $dictd_conf"
			echo "$conf" >> "$dictd_conf"
		fi
		
		if systemctl -q is-active dictd.service
		then
			echo "Restarting dictd service in order to" \
				 "use the new dictionary database"
			systemctl restart dictd.service
		else
			echo "Starting dictd service in order to" \
				 "use the new dictionary database"
			systemctl start dictd.service
		fi
	else
		echo "dictd does not appear to be installed."
		echo "In order to use this database you should either" \
		     "install dictd or alternatively" \
		     "another dict server and configure it on your own."
	fi
	echo
}

post_upgrade()
{
	if pacman -Qq dictd > /dev/null 2>&1    && \
	   systemctl -q is-active dictd.service
	then
		echo -e "\nRestarting dictd service in order to" \
		        "use the updated dictionary database"
		systemctl restart dictd.service
	fi
}

post_remove()
{
	if pacman -Qq dictd > /dev/null 2>&1
	then
		current_conf="$(grep -A 3 "^database *$basename" "$dictd_conf")"
		if test -n "$current_conf"
		then
			echo
			if test "$current_conf" = "$conf"
			then
				echo "Removing configuration for $pkgname from $dictd_conf"
				sed -i "/database $basename {/,/}/d" "$dictd_conf"
			else
				echo "User created / modified configuration" \
					 "for $pkgname in $dictd_conf is left untouched."
			fi
		fi

		if systemctl -q is-active dictd.service
		then
			echo "Restarting dictd service in order to" \
			     "stop using the removed dictionary database"
			systemctl restart dictd.service
		fi
	fi
}
