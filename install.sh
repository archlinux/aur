#---------------------------------------------------------------------------------------------
function post_install() {
    #printf "\e[0;32m${_usage}\e[0m"
    printf "\e[0;32m%s\e[0m" "$(</tmp/pacman-tmpfs_usage.txt)"
    rm -f /tmp/pacman-tmpfs_usage.txt
}

#---------------------------------------------------------------------------------------------
function post_upgrade() {
    post_install
}
