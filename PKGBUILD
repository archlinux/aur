# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=1.3.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-Linux-$CARCH.zip")
sha256sums=('34821aba96b9342af3293f79ff52c8291b39affa2b35d8e90dac3a2c4a2a866f')

package() {
	install -D pandoc-plot-Linux-x86_64/pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
