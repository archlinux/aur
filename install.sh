post_install() {
    useradd nemini
    chown -R nemini:nemini /etc/nemini
    chown -R nemini:nemini /srv/gemini/demo_site
}
