# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.23
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
sha512sums=('3ad922bb1523dee858de1785290b262048b2229a48842499ac431c0f50a40a74005dca276978537ccf2e948a57fc882938d36277495ffb3fe207e2063fc3cb4b')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/solc"
}
