post_install() {
    echo "The easel-driver uses a systemd service to work."
    echo "To start it for this boot, use the following command:"
    echo "    systemctl start post_install"
    echo "To have the service start every boot, use the following command:"
    echo "    systemctl enable --now post_boot"
}
