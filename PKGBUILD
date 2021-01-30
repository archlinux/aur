#! /bin/bash
pkgname="pacman-auto-update"
pkgver=1.1.0
pkgrel=2
arch=("any")
install="${pkgname}.install"
pkgdesc="Install a systemd service triggered by a timer to run automatic pacman package updates"
url="https://github.com/cmuench/pacman-auto-update"
license=("GPL2")
depends=("networkmanager")
source=("git+${url}")
md5sums=("SKIP")

package() {
	cp --recursive "${srcdir}/${pkgname}/root"/* "${pkgdir}"
}

