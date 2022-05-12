# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.5.2
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('49222bbd1779b60da990b7ff7995cca75b217cc874b199e311ff76ec6d6f7fda')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
