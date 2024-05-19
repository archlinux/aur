# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=katex-dist-bin
pkgver=0.16.10
pkgrel=1
pkgdesc='Fast math typesetting for the web'
arch=(any)
url='https://katex.org/'
license=(MIT)
source=("katex-$pkgver.tar.gz::https://github.com/KaTeX/KaTeX/releases/download/v$pkgver/katex.tar.gz")
sha256sums=('eced495f02ee6a3cc9044a81c8e1be7fe339d5365525ddd499d7599fe33ed8a9')

package() {
	mkdir -p "$pkgdir"/usr/share
	mv katex "$pkgdir"/usr/share/katex
}
