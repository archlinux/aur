# Maintainer: Mr_Spade <Mr_Spade at foxmail dot com>

pkgname=book-searcher-bin
_pkgname=book-searcher
pkgver=0.8.3
pkgrel=1
pkgdesc="Create and search books index, create your private library."
arch=('x86_64')
url="https://github.com/book-searcher-org/book-searcher"
license=('BSD')
depends=('webkit2gtk' 'gtk3')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/book-searcher-org/book-searcher/releases/download/${pkgver}/Book-Searcher-desktop_${pkgver}_amd64.deb")

sha512sums=('55183094e9d0c6027b7af9d9bf0616807b1f92d43ee0e8c82f712ca9b0fc131110103aeb10bd5b778640a0ed30e246dbe85cdd6a6e52be5fbd5e91113573e964')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
