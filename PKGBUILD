# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.5.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('dda2221d9cb7a59094a5ddccc0e33c2d278ce5ff60ca6c533e3d1d7d735979ec')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
