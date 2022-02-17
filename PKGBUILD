# Maintainer: Baltazár Radics <baltazar.radics@gmail.com>
pkgname=katex-dist-bin
pkgver=0.15.2
pkgrel=1
pkgdesc='Fast math typesetting for the web'
arch=(any)
url='https://katex.org/'
license=(MIT)
source=("katex-$pkgver.tar.gz::https://github.com/KaTeX/KaTeX/releases/download/v$pkgver/katex.tar.gz")
sha256sums=('9eed54a38d7d092404d5541b30d1c79e477bc24d8c221217228c5c203582d29c')

package() {
	mkdir -p "$pkgdir"/usr/share
	mv katex "$pkgdir"/usr/share/katex
}
