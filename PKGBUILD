# Maintainer: Matthias Puchstein <matthias at puchstein dot lu>

pkgname=ultimatekeys
pkgver=2025.04.25
pkgrel=1
pkgdesc="International US QWERTY keyboard layout with enhanced multilingual support"
arch=('any')
url="https://github.com/pieter-degroote/UltimateKEYS"
license=('GPL-3.0-only')
depends=('xkeyboard-config')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pieter-degroote/UltimateKEYS/archive/refs/tags/r${pkgver//./-}.tar.gz")
sha256sums=('a8b7c7cd73fb4712e1e061a31cccaf41c64f6a68db880f5f0cd1557e1ebbd7cf')

package() {
  cd "${srcdir}/UltimateKEYS-r${pkgver//./-}"

  install -Dm644 linux-xkb/custom "${pkgdir}/usr/share/xkeyboard-config-2/symbols/ultimatekeys"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
