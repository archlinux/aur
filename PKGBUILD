#! /bin/bash
pkgname="pacman-auto-update"
pkgver=1.4.1
pkgrel=1
arch=("any")
install="${pkgname}.install"
pkgdesc="Install a systemd service triggered by a timer to run automatic pacman package updates"
url="https://github.com/cmuench/pacman-auto-update"
license=("GPL2")
depends=("systemd" "pacman-contrib")
optdepends=(
	"networkmanager: for auto-updating only on non metered network"
)
source=("git+${url}")
md5sums=('SKIP')

package() {
	cp --recursive "${srcdir}/${pkgname}/root"/* "${pkgdir}"
}

