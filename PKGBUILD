# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.6.1
pkgrel=0
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('3ca260c3e84c035cdfa12ab035a1186c9580b2aa8c3c7628b4d9cf1a054c5a58')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
