# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.5.4
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('74ca12600db146e5bfb7dfde903bdd4c9584f2380351853574b1f40341b9efa4')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
