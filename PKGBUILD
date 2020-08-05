# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=0.9.0.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-linux-x86_64.tar.xz")
sha256sums=('3e9f177068ca08b5517e7290dd408e39fea6f29c28b4dba40e7951e9e8c562c6')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
