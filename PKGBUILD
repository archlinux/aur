# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=0.8.1.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-linux-x86_64.tar.xz")
sha256sums=('729efd23d4b3ccc22391e5fb00cf0c7f55eb7a944085da7f5c5c99b19bea6b8b')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
