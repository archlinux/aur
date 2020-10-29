# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.0.0.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-linux-$CARCH.tar.xz")
sha256sums=('a0de9ae528f14c62455d66ff448ec773ba81f525b9d0f6b70a14ee445927f685')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
