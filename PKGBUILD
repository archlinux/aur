# Maintainer: Mr_Spade <Mr_Spade at foxmail dot com>

pkgname=book-searcher-bin
_pkgname=book-searcher
pkgver=0.8.5
pkgrel=1
pkgdesc="Create and search books index, create your private library."
arch=('x86_64')
url="https://github.com/book-searcher-org/book-searcher"
license=('BSD')
depends=('webkit2gtk' 'gtk3')

source=("${_pkgname}-${pkgver}-${arch}.deb::https://github.com/book-searcher-org/book-searcher/releases/download/${pkgver}/Book-Searcher-desktop_${pkgver}_amd64.deb")

sha512sums=('1707d891284e99ec1b663a4218bf2ee57518c17a4e049729018d82e85f70582dc9d067fa791f2b13c8d51e720de86ff684a16c466e35f21505667ca3036c10db')

package() {
	tar xpf data.tar.gz -C ${pkgdir}
}
