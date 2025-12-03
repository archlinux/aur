# Maintainer: Serge K <arch@phnx47.net>

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.31
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/argotorg/solidity'
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
sha512sums=('509aea4497e039ef75b97a99941fe7d6581108bd8a872a029559cef9bb559272537ab392c52bb01fbc6aa944e588afb9a008bf41a69b4922e30af25f9eb0f8a1')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/solc"
}
