#!/usr/bin/env bash

_install() {
    echo -e "\n>>> Creating rtorrent folder tree..."
    mkdir -vp $HOME/.rtorrent/{downloads,session,logs,watch}
    mkdir -p bin .local

    echo -en "\n>>> Checking PATH... "
    [[ $PATH =~ "$HOME/bin:" ]] &&
        echo "ok" || { echo "add ~/bin to your PATH"; export PATH="$PATH:$HOME/bin"; }

    echo -e "\n>>> Installing pyroscope tools..."
    git clone -q https://github.com/pyroscope/pyrocore.git .local/pyroscope ||exit 1
    ~/.local/pyroscope/update-to-head.sh python2
}

_update() {
    git -C .local/pyroscope pull
    ~/.local/pyroscope/update-to-head.sh python2
}

cd $HOME
[[ -d .local/pyroscope ]] &&
    _update || _install
