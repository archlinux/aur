# Maintainer: Mr_Spade <Mr_Spade at foxmail dot com>

pkgname=book-searcher-bin
_pkgname=book-searcher
pkgver=0.9.0
pkgrel=1
pkgdesc="Create and search books index, create your private library."
arch=('x86_64')
url="https://github.com/book-searcher-org/book-searcher"
license=('BSD')
depends=('webkit2gtk' 'gtk3')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/book-searcher-org/book-searcher/releases/download/${pkgver}/Book-Searcher-desktop_${pkgver}_amd64.deb")

sha512sums=('8973635b09da484e7152181d2a09022ce6eeb3ef5f878b312cec32286a62ef71d5afb0fde168cb09e2640e62e0dee3f604763924e604b3a0b73b4f823ac982b1')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
