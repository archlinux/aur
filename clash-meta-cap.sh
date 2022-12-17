#/bin/sh

post_install() {
    echo 'Granting Capabilities to Clash.Meta...'
    /usr/bin/setcap 'cap_net_bind_service=+ep cap_net_admin=+ep' /usr/bin/clash-meta
}

post_remove() {
    echo 'Revoking Capabilities from Clash.Meta...'
    /usr/bin/setcap 'cap_net_bind_service=-ep cap_net_admin=-ep' /usr/bin/clash-meta
}
