# Maintainer: Serge K <arch@phnx47.net>

_appname=chain-maind
_pkgname="cro-${_appname}"
pkgname="${_pkgname}-bin"
pkgver=5.0.1
pkgrel=1
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_appname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_appname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('f51f6fa1719d4824f47b004f3c45b2a44d431ee7a121dfb410389392ab4df47a')
sha256sums_aarch64=('97610a5b2a96801468ab18e06afbadca29eeac6ead40deeafea257cfac4c1b25')

package() {
  install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}
