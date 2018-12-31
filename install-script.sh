function install_and_upgrade_procedure() {
    useradd -r ntopng || :
}

function post_install() {
    install_and_upgrade_procedure
}

function post_upgrade() {
    install_and_upgrade_procedure
}
