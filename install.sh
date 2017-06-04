#!/bin/bash

export _DID_INSTALL=0

post_install() {
    [ "$_DID_INSTALL" -eq 1 ] && return
   
    export _DID_INSTALL=1
    echo "Making /var/lib/pacman-utils/env happy in its new home..."
    virtualenv --relocatable /var/lib/pacman-utils/env >/dev/null 2>&1
}

post_upgrade() {
    post_install $@
}
