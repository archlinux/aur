post_install() {
    echo "Restarting Plasmashell"
    systemctl --user restart plasma-plasmashell
}
