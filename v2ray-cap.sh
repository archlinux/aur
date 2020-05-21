#/bin/sh

post_install() {
    echo 'Granting Capabilities to V2Ray Core...'
    /usr/bin/setcap 'cap_net_bind_service=+ep cap_net_admin=+ep' /usr/lib/v2ray/v2ray
}

post_remove() {
    echo 'Revoking Capabilities from V2Ray Core...'
    /usr/bin/setcap 'cap_net_bind_service=-ep cap_net_admin=-ep' /usr/lib/v2ray/v2ray
}
