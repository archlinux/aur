#!/bin/sh
post_install() {
    echo "The EASEA binaries are in /opt/easea/bin"
    echo "The EASEA samples are in /opt/easea/samples"
    echo "The EASEA docs are in /opt/easea/doc/easea_manual.pdf"
    echo "You need to relogin in order for the EASEA binaries to appear in your PATH"
    post_upgrade
}

post_upgrade() {
    ldconfig -r .
}