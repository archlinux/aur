#!/usr/bin/env sh

post_install() {
    echo 'To enable, add the following line to the end of /etc/pam.d/system-login:'
    echo '  session    optional   pam_tmpdir.so'
    echo 'On the next login, $TMPDIR will point to your per-user temporary directory'
}

