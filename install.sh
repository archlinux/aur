## arg 1:  the new package version
#pre_install() {
	# do something here
#}

## arg 1:  the new package version
post_install() {
	# TODO: this fails the first time we install because the group still doesn't
	# exist
	chgrp bautista /etc/bautista/config.toml

echo
echo '88                                             88                                  '
echo '88                                      ,d     ¨¨               ,d                 '
echo '88                                      88                      88                 '
echo '88,dPPYba,   ,adPPYYba,  88       88  MM88MMM  88  ,adPPYba,  MM88MMM  ,adPPYYba,  '
echo '88P´    ¨8a  ¨¨     `Y8  88       88    88     88  I8[    ¨¨    88     ¨¨     `Y8  '
echo '88       d8  ,adPPPPP88  88       88    88     88   `¨Y8ba,     88     ,adPPPPP88  '
echo '88b,   ,a8¨  88,    ,88  ¨8a,   ,a88    88,    88  aa    ]8I    88,    88,    ,88  '
echo '8Y¨Ybbd8¨´   `¨8bbdP¨Y8   `¨YbbdP´Y8    ¨Y888  88  `¨YbbdP¨´    ¨Y888  `¨8bbdP¨Y8  '
echo
echo
echo '  Follow the next steps to complete installation:'
echo
echo '    1. Edit /etc/bautista/config.toml file to configure credentials and'
echo '       device rules.'
echo
echo '         sudo vi /etc/bautista/config.toml'
echo
echo
echo '    3. Enable and start bautista service in systemd:'
echo
echo '         sudo systemctl enable bautista'
echo '         sudo systemctl start bautista'
echo
echo 
}

## arg 1:  the new package version
## arg 2:  the old package version
#pre_upgrade() {
	# do something here
#}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
	chgrp bautista /etc/bautista/config.toml
}

## arg 1:  the old package version
#pre_remove() {
	# do something here
#}

## arg 1:  the old package version
#post_remove() {
	# do something here
#}
