# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=katex-dist-bin
pkgver=0.16.0
pkgrel=1
pkgdesc='Fast math typesetting for the web'
arch=(any)
url='https://katex.org/'
license=(MIT)
source=("katex-$pkgver.tar.gz::https://github.com/KaTeX/KaTeX/releases/download/v$pkgver/katex.tar.gz")
sha256sums=('d6d156b40b6019e81bc3024217522f3c303b9128cdd013d20167f531973f7edc')

package() {
	mkdir -p "$pkgdir"/usr/share
	mv katex "$pkgdir"/usr/share/katex
}
