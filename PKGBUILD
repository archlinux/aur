# Maintainer: Serge K <arch@phnx47.net>

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.27
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
sha512sums=('6550177d642061f1698cc724e7dad063f44bb85e6b4cb54cbc86530452ac9e1f02c9b573eb640167aa972e0592985d9464e55e4efb2894ec7cd3cbba0cae2729')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/solc"
}
