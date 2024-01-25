# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.24
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
sha512sums=('162ce4e6f135676d626b10dbac975df07b3705e36c3170347e09bc211c5d352b663e78452516ff1acba0c91c97bb9d498a31e0848e3cec1ecf6312cd5b1869c5')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/solc"
}
