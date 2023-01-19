# Maintainer: Mr_Spade <Mr_Spade at foxmail dot com>

pkgname=book-searcher-bin
_pkgname=book-searcher
pkgver=0.8.4
pkgrel=1
pkgdesc="Create and search books index, create your private library."
arch=('x86_64')
url="https://github.com/book-searcher-org/book-searcher"
license=('BSD')
depends=('webkit2gtk' 'gtk3')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/book-searcher-org/book-searcher/releases/download/${pkgver}/Book-Searcher-desktop_${pkgver}_amd64.deb")

sha512sums=('f2f260bb733eeb4284083bd86ae5b1d8faad8c49e1d3fbcd8e15f11ab9a64398d8793cbd68fa1c543cdc8338ce077c1aacd16e415b4ef9f0c00e8ee366274acc')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
