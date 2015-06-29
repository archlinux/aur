post_install() {
    cat <<- EOF
    ==> Add the following lines to your ~/.emacs file.
    ==> (add-to-list 'load-path "/usr/share/emacs/scala-mode")
    ==> (require 'scala-mode-auto)
EOF
}

post_upgrade() {
    post_install $0
}
