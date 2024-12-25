# Create automx2 user account if it does not already exist
# vim: ts=4 sw=4 noet
# shellcheck shell=bash
post_install() {
	local u="automx2"
	grep -q "^${u}:" /etc/passwd && return
	local d="/var/lib/${u}"
	echo "Creating user account ${u} with home directory ${d}"
	useradd -mrd "${d}" "${u}"
	rm -fr "${d}"/.*
}
