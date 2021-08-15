# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=zigmod-bin
pkgver=69
pkgrel=1
pkgdesc="A package manager for the Zig programming language"
url="https://github.com/nektro/zigmod"
license=('MIT')
arch=('x86_64')
provides=('zigmod')
conflicts=('zigmod')
source=(
  "${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/zigmod-x86_64-linux"
)
sha256sums=(
  'b1cbd305729ce48d649ef05ce61e5f54581ff3540474e98b37e1085d5556be7a'
)

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/zigmod"
}
