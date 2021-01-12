# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.0.2.1
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/v$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('7710be43313c5338fbc4feebad4e6eb2c0bc45f64a68ff80fbc11e2b0eda75a2')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
