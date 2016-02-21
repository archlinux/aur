post_install() {
    groupadd --gid 533 heka >/dev/null
    useradd --uid 533 --gid heka --home-dir / --shell /usr/bin/false heka >/dev/null
}

post_remove() {
    userdel heka >/dev/null
}
