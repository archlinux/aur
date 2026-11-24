## arg 1:  the new package version
#pre_install() {
	# do something here
#}

## arg 1:  the new package version
post_install() {
	systemctl enable peter.service
	systemctl restart peter.service
}

## arg 1:  the new package version
## arg 2:  the old package version
#pre_upgrade() {
	# do something here
#}

## arg 1:  the new package version
## arg 2:  the old package version
post_upgrade() {
	systemctl enable peter.service
	systemctl restart peter.service
}

## arg 1:  the old package version
#pre_remove() {
	# do something here
#}

## arg 1:  the old package version
post_remove() {
	systemctl stop peter.service
	systemctl disable peter.service
}
