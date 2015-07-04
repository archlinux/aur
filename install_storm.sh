post_install() {
    systemd-sysusers storm.conf
    systemd-tmpfiles --create storm.conf
}

post_upgrade(){
    systemd-sysusers storm.conf
    systemd-tmpfiles --create storm.conf
}

post_remove() {
    if getent passwd storm >/dev/null 2>&1; then
        userdel -f storm
    fi
    if getent group storm >/dev/null 2>&1; then
        groupdel -f storm
    fi
}
