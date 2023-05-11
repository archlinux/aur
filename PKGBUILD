# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.20
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
sha512sums=('48c406ab082abd785225dfc65824fac54b3e7c625554cde8a63a3ccf474ad888a7d33f3da160bbaef379523a44da633e45f27939fa66dfbe7fdfd167146037ff')

package() {
  install -Dm755 ${_pkgname}-${pkgver}.bin "${pkgdir}/usr/bin/solc"
}
