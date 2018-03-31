# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=nnedi3_weights_bin
pkgname=vapoursynth-plugin-${_plug}
pkgver=r1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('any')
url='https://github.com/jpsdr/NNEDI3'
license=('GPL')
source=('nnedi3_weights.bin::https://github.com/jpsdr/NNEDI3/raw/master/nnedi3/binary1.bin')
sha256sums=('27f382430435bb7613deb1c52f3c79c300c9869812cfe29079432a9c82251d42')

package() {
  install -Dm644 nnedi3_weights.bin "${pkgdir}/usr/lib/vapoursynth/nnedi3_weights.bin"
}

