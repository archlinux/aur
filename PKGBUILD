# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.1.1
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('e39b03eb9621660f52982e4972a4d15443d6797d2776aeedbb708337be77f5d0')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
