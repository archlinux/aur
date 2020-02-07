# Mullvad CLI and Daemon

This repository is an alternative for people who want to avoid building and running the Electron-App and instead want to rely on the systemd-daemon and the cli. Oriented on [mullvad-vpn in the AUR.](https://aur.archlinux.org/packages/mullvad-vpn/).

## Build
`gpg2 --keyserver pool.sks-keyservers.net --recv-keys EA0A77BF9E115615FC3BD8BC7653B940E494FE87`
`gpg2 --edit-key EA0A77BF9E115615FC3BD8BC7653B940E494FE87`
in gpg console enter `trust`
in gpg console enter `5`
in gpg console enter `quit`
makepkg

## CLI Manual
https://mullvad.net/en/help/how-use-mullvad-cli/

## Settings
You need to put your account number and where you want to connect to into the /etc/mullvad-vpn/settings.json.

## optional Panel Monitor
For Xfce I am using a [Generic Monitor](https://docs.xfce.org/panel-plugins/xfce4-genmon-plugin) with a check on /usr/bin/mullstat.sh every few seconds. It only checks the daemon-status and returns a string.
