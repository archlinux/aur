# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=0.8.0.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-linux-x86_64.tar.xz")
sha256sums=('cf3ca956d7fea6c744c0ccf88fb9ef3f0f1a36a22617aa871a183659823b0101')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
