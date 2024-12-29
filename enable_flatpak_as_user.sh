#!/bin/sh
flatpak remote-add --if-not-exists flathub-user https://dl.flathub.org/repo/flathub.flatpakrepo --user
pkexec --user root flatpak remote-delete flathub
rm enable_flatpak_as_user.sh
