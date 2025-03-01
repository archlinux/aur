# Maintainer: Serge K <arch@phnx47.net>

_pkgbin=chain-maind
_pkgname="cro-${_pkgbin}"
pkgname="${_pkgname}-bin"
pkgdesc='Crypto.org Chain CLI'
pkgver=4.2.13
pkgrel=1
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgbin}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_pkgbin}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('2dc3ce75921482f40682a805c2130512abab1c197473974eb93049f70d04cc45')
sha256sums_aarch64=('e9b7189313cc99353ae0cb90626105b9b0ac3a03a907094afced7ed08f600954')

package() {
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
}
