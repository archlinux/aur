post_install() {
    systemd-sysusers kafka.conf
    systemd-tmpfiles --create kafka.conf
}

post_upgrade(){
    systemd-sysusers kafka.conf
    systemd-tmpfiles --create kafka.conf
}

post_remove() {
    if getent passwd kafka >/dev/null 2>&1; then
        userdel -f kafka
    fi
    if getent group kafka >/dev/null 2>&1; then
        groupdel -f kafka
    fi
}
