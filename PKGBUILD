# Maintainer: Mr_Spade <Mr_Spade at foxmail dot com>

pkgname=book-searcher-bin
_pkgname=book-searcher
pkgver=0.8.2
pkgrel=1
pkgdesc="Create and search books index, create your private library."
arch=('x86_64')
url="https://github.com/book-searcher-org/book-searcher"
license=('BSD')
depends=('webkit2gtk' 'gtk3')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/book-searcher-org/book-searcher/releases/download/${pkgver}/Book-Searcher-desktop_${pkgver}_amd64.deb")

sha512sums=('9adc69e9275e9d87112d2d0965cf0119fd66679857ce834455e6f59455d8af9dbdcb26034283efb809944e21b0463475f8f6436b2be79891f87e8a93cb5985e5')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
