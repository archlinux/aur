post_install() {
	if [ ! -f /etc/hyprlux/config.toml ]; then
        install -Dm644 /usr/share/hyprlux/config.toml /etc/hyprlux/config.toml
    fi

    echo "To enable hyprlux, run:"
    echo "  systemctl --user enable --now hyprlux.service"
}

post_upgrade() {
	if [ ! -f /etc/hyprlux/config.toml ]; then
        install -Dm644 /usr/share/hyprlux/config.toml /etc/hyprlux/config.toml
    fi

    echo "Hyprlux upgraded. If the service was running, restart it with:"
    echo "  systemctl --user restart hyprlux.service"
}

post_remove() {
	rm -f /etc/hyprlux/config.toml
    echo "To disable hyprlux service, run:"
    echo "  systemctl --user disable --now hyprlux.service"
}
