post_install() {
    echo "=================================================================="
    echo "waybar-weather:"
    echo "The documentation can be found at:"
    echo "    /usr/share/doc/waybar-weather/README.md"
    echo
    echo "Example config files are located at:"
    echo "    /usr/share/waybar-weather/"
    echo "To use them, copy the desired files to:"
    echo "    ~/.config/waybar-weather/"
    echo
    echo "The waybar-weather binary requires the 'cap_net_admin' capability."
    echo "This capability has been set automatically."
    echo "To remove the capability again, run:"
    echo "    sudo setcap -r /usr/bin/waybar-weather"
    echo "=================================================================="

    setcap cap_net_admin+ep /usr/bin/waybar-weather
}

post_upgrade() {
    post_install
}
