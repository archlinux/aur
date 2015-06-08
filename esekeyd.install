#!/bin/bash

post_install() {
    cat<<INSTALLEOF
    Edit the example configuration file provided in /etc/esekeyd.conf and enable/start it using systemctl.
INSTALLEOF
}

post_upgrade() {
    post_install
}
