# Maintainer: Lena Fuhrimann

pkgname=pacmanfile
pkgver=0.0.5
pkgrel=2
pkgdesc='Manage your pacman packages declaratively'
arch=(x86_64 i686)
url="https://github.com/mastertinner/pacmanfile"
license=(Apache)
provides=(pacmanfile)
source=('https://raw.githubusercontent.com/mastertinner/pacmanfile/main/pacmanfile')
sha256sums=('1f02e04bc0e27bd67141aa16f937a2a591f2f1bf58afd0b34a325e04e2775fda')

package() {
	install -Dm755 pacmanfile -t "${pkgdir}/usr/bin"
}
