# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.1.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('cac5e764269e542e15f99fa8790ed706b33ca84d10f286971efc46de685bf26b')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
