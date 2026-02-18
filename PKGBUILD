# Maintainer: Serge K <arch@phnx47.net>

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.34
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/argotorg/solidity'
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
sha512sums=('503f5de6c189b40926107847b881a509a9ad3e10a20c1fd5f68552a6c2bbe8fe2f63d0135094cfa3c7ea0ce640991ea8e527ec32a0ec3de85e379a2a99be50a3')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/solc"
}
