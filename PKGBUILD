# Maintainer: Serge K <arch@phnx47.net>

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.35
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64' 'aarch64')
url='https://github.com/argotorg/solidity'
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}-${pkgver}-${arch[0]}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
source_aarch64=("${_pkgname}-${pkgver}-${arch[1]}.bin::${url}/releases/download/v${pkgver}/solc-static-linux-arm")
sha512sums_x86_64=('735face3db06e5129d367a223033b1dd68bfd16fdacb476f73842fd971790cceddb265a660895dc67782010cec5762a071d27f77ba32f4fedbb7b87439291e90')
sha512sums_aarch64=('65c2973286f9d39d5d471b240806ac011c144a0ea98d6890bf4286ed3d67ec718154b9b7a2b8ca4757b26399fd189b9f13413d047e74fe15df2abb23f17e27b6')

package() {
  install -Dm755 "${_pkgname}-${pkgver}-${CARCH}.bin" "${pkgdir}/usr/bin/solc"
}
