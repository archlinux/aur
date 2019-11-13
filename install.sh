post_install() {
    # For now, the launcher needs to set CAP_SYS_NICE on the downloaded game
    # client (to make the audio issues go away), hence the CAP_SETFCAP.
    #
    # If the client eventually learns how to raise ambient capabilities, then
    # just `setcap CAP_SYS_NICE` by itself will be enough. But we can't really
    # achieve this at Arch side.

    #setcap cap_sys_nice=eip usr/share/games/runescape-launcher/runescape
    setcap cap_setfcap=eip usr/share/games/runescape-launcher/runescape
}

post_upgrade() {
    post_install
}

# vim: ft=sh:ts=4:sw=4:et:nowrap
