# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.25
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
sha512sums=('8f3d06b3d02002238233fc383538aa3474cc1999b6602a74abccf60698f3b3a29b4799c8127ff3cdaf592fa2ffb1dd078449a776e01d8ec390d3060dd55d3efd')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/solc"
}
