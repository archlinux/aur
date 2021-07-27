# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=katex-dist-bin
pkgver=0.13.13
pkgrel=1
pkgdesc='Fast math typesetting for the web'
arch=(any)
url='https://katex.org/'
license=(MIT)
source=("$pkgname-$pkgver.tar.gz::https://github.com/KaTeX/KaTeX/releases/download/v$pkgver/katex.tar.gz")
sha256sums=('4797fa7a49e3b9579164a2c8ad30abd383653535731b82b4714f9fbe69de183a')

package() {
	mkdir -p "$pkgdir"/usr/share
	mv katex "$pkgdir"/usr/share/katex
}
