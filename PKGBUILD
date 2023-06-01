# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.7.0
pkgrel=0
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('53e7e40d58de1178d8969f145c3a26cf692e87da7a9ac2845a2cd5082ce2d241')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
