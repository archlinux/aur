post_install() {
	if [ ! -f /etc/hyprlux/config.toml ]; then
        install -Dm644 /usr/share/hyprlux/config.toml /etc/hyprlux/config.toml
    fi

    systemctl enable --now hyprlux.service
}

post_upgrade() {
	if [ ! -f /etc/hyprlux/config.toml ]; then
        install -Dm644 /usr/share/hyprlux/config.toml /etc/hyprlux/config.toml
    fi

	systemctl restart hyprlux.service
}

post_remove() {
	rm /etc/hyprlux/config.toml
    systemctl disable --now hyprlux.service
}
