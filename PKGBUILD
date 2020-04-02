# Maintainer: Harry Beadle <harrybeadle ant protonmail dog com>

pkgname='rofi-applets-menus'
pkgrel='1'
pkgver='6e84e05'

pkgdesc='A collection of custom applets and menus made using rofi and its dmenu emulation, inspired by rofi-menus.'
arch=('x86_64')
url='https://github.com/adi1090x/rofi'
license=('GPL')
optdepends=('xbacklight: adjust brightness'
	      'dunst: nofify'
	      'acpi: get battery info'
	      'xfce4-power-manager-settings: launch power manager'
	      'mpd'
	      'mpc'
	      'dnsutils'
	      'nmcli'
	      'nmtui'
	      'bmon'
	      'nm-connection-editor'
	      'termite'
	      'systemctl'
	      'i3lock'
	      'firefox'
	      'scrot'
	      'maim'
	      'viewnior'
	      'amixer')
makedepends=('git')

source=('git+https://github.com/adi1090x/rofi')
md5sums=('SKIP')

package() {
    cd rofi
    chmod +x scripts/*
    cp -r scripts themes config.rasi ~/.config/rofi
}	      