#!/bin/sh

build() {
	add_runscript
	add_file "/usr/share/ovlroot/ovlroot.sh" "/bin/ovlroot.sh" "0555"
	add_full_dir "/etc/ovlroot.d"
}
