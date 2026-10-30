#---------------------------------------------------------------------------------------------
function post_install() {
    printf "\e[0;32m%s\e[0m" "$(</tmp/gentoo-color-bash_usage.txt)"
    rm -f /tmp/gentoo-color-bash_usage.txt
}

#---------------------------------------------------------------------------------------------
function post_upgrade() {
    post_install
}
