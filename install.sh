post_install() {
	u="automx2"
	grep -q "^$u:" /etc/passwd && return
	echo Creating user account $u
	d="/var/lib/$u"
	useradd -mrd $d $u
	rm -fr $d/.*
}
