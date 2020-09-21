# Maintainer: syntonym <syntaar@gmail.com>
pkgname=pandoc-plot-bin
pkgver=0.9.3.0
pkgrel=1
epoch=
pkgdesc="Render and include figures in Pandoc documents using your plotting toolkit of choice"
arch=('x86_64')
url="https://github.com/LaurentRDC/pandoc-plot"
license=('GPL2')
source=("https://github.com/LaurentRDC/pandoc-plot/releases/download/$pkgver/pandoc-plot-linux-$CARCH.tar.xz")
sha256sums=('cd58a5fd8eb887636a86451967f18440daef9b3e7f836c8eba43168ff7f25707')

package() {
	install -D pandoc-plot ${pkgdir}/usr/bin/pandoc-plot
}
