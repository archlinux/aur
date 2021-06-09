# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=zigmod-bin
pkgver=42
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
  'eaa07036d0f235d66fb3fe26e3f15e63f4f9dd67bc25f62056853dfb1212f016'
)

package() {
  install -D -m755 "${srcdir}/${pkgname}-${pkgver}" "${pkgdir}/usr/bin/zigmod"
}
