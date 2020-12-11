# Maintainer: Tobi Fuhrimann

pkgname=pacmanfile
pkgver=0.0.1
pkgrel=4
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/pacmanfile"
license=(Apache)
provides=(pacmanfile)
source=('https://raw.githubusercontent.com/mastertinner/pacmanfile/main/pacmanfile')
sha256sums=('55d5538f8a682acda41f81776dc0609d6b44c145d51d53ddf14a709b38856c16')

package() {
	install -Dm755 pacmanfile -t "${pkgdir}/usr/bin"
}
