post_install() {
    systemd-sysusers zookeeper.conf
    systemd-tmpfiles --create zookeeper.conf
}

post_upgrade(){
    systemd-sysusers zookeeper.conf
    systemd-tmpfiles --create zookeeper.conf
}

post_remove() {
    if getent passwd zookeeper >/dev/null 2>&1; then
        userdel -f zookeeper
    fi
    if getent group zookeeper >/dev/null 2>&1; then
        groupdelf zookeeper
    fi
}
