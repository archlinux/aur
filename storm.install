post_install() {
    systemd-sysusers storm.conf
    systemd-tmpfiles --create storm.conf
}

post_upgrade(){
    systemd-sysusers storm.conf
    systemd-tmpfiles --create storm.conf

    echo "Moving to Storm 1.0 is not a rolling upgrade."
    echo "Have a look at the following JIRA report for migration hints:"
    echo "  https://issues.apache.org/jira/browse/STORM-1710"
}

post_remove() {
    if getent passwd storm >/dev/null 2>&1; then
        userdel -f storm
    fi
    if getent group storm >/dev/null 2>&1; then
        groupdel -f storm
    fi
}
