post_install() {
    echo "Cherry Doom uses FluidSynth for high-quality MIDI playback."
    echo "You can install a soundfont package such as 'soundfount-fluid', or add your"
    echo "own soundfont directories to soundfont_dir in ~/.local/share/cherry-doom/cherry-doom.cfg"
    echo "Soundfonts can be selected from the Options -> General menu inside Cherry Doom."
    echo "See also https://wiki.archlinux.org/title/FluidSynth for more information."
}

post_upgrade() {
    post_install
}
