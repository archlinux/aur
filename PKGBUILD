# Maintainer: Markus Schaaf <markuschaaf@gmail.com>
pkgname=nnedi3-weights
pkgver=1.0
pkgrel=1
pkgdesc='Model data for nnedi edge directed neural network deinterlacer/upscaler'
arch=(any)
url='https://github.com/dubhater/vapoursynth-nnedi3/'
license=(GPL2)
source=("https://raw.githubusercontent.com/dubhater/vapoursynth-nnedi3/master/src/nnedi3_weights.bin")

package() {
	install -D -t "$pkgdir/usr/share/nnedi3" nnedi3_weights.bin
}

sha256sums=('27f382430435bb7613deb1c52f3c79c300c9869812cfe29079432a9c82251d42')
