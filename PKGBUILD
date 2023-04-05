# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.19
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/ethereum/solidity'
license=('GPL3')
optdepends=('z3: SMT checker' 'cvc4: SMT checker')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
sha512sums=('7805ee2c1e70f2004eeb514f98a18d8260644c2f4bbf2e50f7f92e24b9ec2dbdc3e96ccbfe2570912f48bf0611b885594d2a6635527bc53d811dd56fb596e41b')

package() {
  install -Dm755 ${_pkgname}-${pkgver}.bin "${pkgdir}/usr/bin/solc"
}
