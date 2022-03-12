# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=zigmod-bin
pkgver=r77
pkgrel=1
epoch=1
pkgdesc="A package manager for the Zig programming language"
url="https://github.com/nektro/zigmod"
license=('MIT')
arch=('x86_64')
provides=('zigmod')
conflicts=('zigmod')
source=(
  "${pkgname}-${pkgver}::${url}/releases/download/${pkgver}/zigmod-x86_64-linux"
)
sha256sums=(
  'c414c707889ea94a906d14c908c06822ebe77d0912b3fc6621501a5952077fe3'
)

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/zigmod"
}
