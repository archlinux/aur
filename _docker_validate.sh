#!/bin/bash -e
# based on https://www.reddit.com/r/archlinux/comments/6qu4jt/how_to_run_makepkg_in_docker_container_yes_as_root/dl1t5m9/
if ! [ -f '/source/_docker_validate.sh' ]; then
    echo "[!] Did not find source/_docker_validate.sh - are you running from within docker? (with correct mount)"
    exit 1
fi
if [ "$EUID" = 0 ]; then
    pacman -Sy --needed --noconfirm base-devel
    useradd builduser -m # Create the builduser
    passwd -d builduser # Delete the buildusers password
    printf 'builduser ALL=(ALL) ALL\n' | tee -a /etc/sudoers # Allow the builduser passwordless sudo
    echo "[ ] Dropping to builduser"
    exec sudo -u builduser "$0" "$@"
else
    gpg --recv-keys 7082A0A50A2E92640F3880E0E4522DCC9B246FF7
    cd ~
    cp -r /source build
    cd build
    echo "[ ] Starting to build"
    makepkg -isc --noconfirm
fi
