#!/bin/sh
post_upgrade() {
    _info
}

post_install() {
    _info
}

_info() {
	echo ">>> For enable the module change prosody configuration"
	echo ">>> /etc/prosody/prosody.cfg.lua"
    echo ""
	echo "modules_enabled = {"
	echo "	\"log_auth\";"
	echo "	..."
	echo "}"
    echo ""
    echo ">>> For use with Fail2Ban add these lines in /etc/fail2ban/jail.conf"
	echo ">>> And check the file define for log info in /etc/prosody/prosody.cfg.lua"
    echo ">>>  log = {"
	echo ">>> 		info = \"/var/log/prosody/prosody.log\";"
    echo ""
    echo "[prosody]"
    echo "enabled  = true"
    echo "action   = iptables[name=prosody, port=5222, protocol=tcp]"
	echo "filter   = prosody-auth"
	echo "logpath  = /var/log/prosody/prosody*.log"
	echo "maxretry = 5"
}
