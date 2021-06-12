# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.2.3
pkgrel=2
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('108b70fb4120126fbf2f836d2a9d980deeff364c5f95f61873a5fa10e877712d')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
