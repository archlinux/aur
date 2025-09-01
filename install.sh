post_install() {
    echo "Restarting Plasmashell"
    systemctl --user restart plasma-plasmashell

    post_upgrade
}

post_upgrade() {
    echo "NOTICE: The kara-git package has been moved to plasma6-applets-kara-git."\
    "Please remove this package and install plasma6-applets-kara-git instead."
    echo "To completely remove this package, delete ~/.local/share/plasma/plasmoids/org.dhruv8sh.kara if present."
}

