# Maintainer: Serge K <arch@phnx47.net>

_pkgname=solidity
pkgname="${_pkgname}-bin"
pkgver=0.8.32
pkgrel=1
pkgdesc='Contract-Oriented Programming Language'
arch=('x86_64')
url='https://github.com/argotorg/solidity'
license=('GPL-3.0-or-later')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.bin::${url}/releases/download/v${pkgver}/solc-static-linux")
sha512sums=('f30806a4b1e56eef79a91728b61c9b68383dde40a29530db148867a5bf49b2b79c9603f455dd4411be7336894d93d60d934aae3129381f9cc5c57501ae0a6157')

package() {
  install -Dm755 "${_pkgname}-${pkgver}.bin" "${pkgdir}/usr/bin/solc"
}
