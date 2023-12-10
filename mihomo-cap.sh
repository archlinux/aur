#/bin/sh

post_install() {
    echo 'Granting Capabilities to mihomo...'
    /usr/bin/setcap 'cap_net_bind_service=+ep cap_net_admin=+ep' /usr/bin/mihomo
}

post_remove() {
    echo 'Revoking Capabilities from mihomo...'
    /usr/bin/setcap 'cap_net_bind_service=-ep cap_net_admin=-ep' /usr/bin/mihomo
}
