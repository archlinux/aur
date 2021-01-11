# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.0.2.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/v$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('3b50d5926207064caf609b097042f6ad774de1bcd32e122f3d595d300affe316')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
