# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.0.1.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-linux-$CARCH.tar.xz")
sha256sums=('ca68d12230b17eb8a97a186a6500da77bd391816ede1138731440e81803ba44d')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
