# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=0.9.2.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-linux-x86_64.tar.xz")
sha256sums=('2d12142f34e1df8befbf917fa79f11e97d47060328239e9e98a788bf32297f48')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
