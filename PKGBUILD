# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=katex-dist-bin
pkgver=0.16.8
pkgrel=1
pkgdesc='Fast math typesetting for the web'
arch=(any)
url='https://katex.org/'
license=(MIT)
source=("katex-$pkgver.tar.gz::https://github.com/KaTeX/KaTeX/releases/download/v$pkgver/katex.tar.gz")
sha256sums=('add3e7e701e647b708ca259fc158488f57894c514a016f5efc7915204664f72f')

package() {
	mkdir -p "$pkgdir"/usr/share
	mv katex "$pkgdir"/usr/share/katex
}
