#!/usr/bin/env sh

post_install() {
    echo 'To enable, add the following line to the end of /etc/pam.d/system-login:'
    echo '  session    optional   pam_tmpdir.so'
}

