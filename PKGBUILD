# Maintainer: Serge K <arch@phnx47.net>

_pkgbin=chain-maind
_pkgname="cro-${_pkgbin}"
pkgname="${_pkgname}-bin"
pkgdesc='Crypto.org Chain CLI'
pkgver=4.2.12
pkgrel=1
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgbin}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_pkgbin}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('1de73e25948a620b9dca6af8c4333545fe3536079adf6b696f95736d1cddb1ce')
sha256sums_aarch64=('abd390bb5591854c9fd408c939a452bd8ce4da833917e5601a30f28dfccecb78')

package() {
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
}
