IFS= read -r -d '' _usage << 'EOF'

    # USAGE:
    # after install package, you can enable it in two steps

    # step 1. system integration (run once, copy/paste block)
    sudo cp -n /etc/skel/.bashrc{,.default.bak}
    sudo cp -n /etc/bash.bashrc{,.default.bak}
    sudo sed -i '/PS1.*/s/^#*/#/' /etc/skel/.bashrc /root/.bashrc > /dev/null 2>&1
    echo '# --- my addon ----------------------------' | sudo tee -a /etc/bash.bashrc
    echo 'source /usr/share/gentoo-color-bash/10-gentoo-color.bash 2>/dev/null' | sudo tee -a /etc/bash.bashrc

    # step 2. for every exist user after login run once (copy/paste block)
    cp -n ~/.bashrc{,.default.bak}
    sed -i '/PS1.*/s/^#*/#/' ~/.bashrc

    # Now you can add (if needed) you own ~/.dir_colors or /etc/DIR_COLORS for perfect ls.
    # See arch wiki or github for examples.
EOF

#--------------------------------------------------------------------------------------------------
function post_install() {
    printf "\e[0;32m${_usage}\e[0m"
}

#--------------------------------------------------------------------------------------------------
function post_upgrade() {
    post_install ${1}
}

#post_install
