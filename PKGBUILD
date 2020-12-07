# Maintainer: Tobi Fuhrimann

pkgname=pacfile-bin
pkgver=0.0.1
pkgrel=1
pkgdesc="Manage your pacman packages declaratively"
arch=(x86_64 i686)
url="https://github.com/mastertinner/pacfile"
license=(Apache)
provides=(pacfile)
source=("https://raw.githubusercontent.com/mastertinner/pacfile/main/pacfile")

package() {
	install -Dm755 pacfile -t "${pkgdir}/usr/bin"
}
