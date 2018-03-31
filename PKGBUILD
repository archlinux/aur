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
sha256sums=('SKIP')

package() {
  install -Dm644 nnedi3_weights.bin "${pkgdir}/usr/share/nnedi3/nnedi3_weights.bin"
}

