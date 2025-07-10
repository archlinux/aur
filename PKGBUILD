# Maintainer: Serge K <arch@phnx47.net>

_appname=chain-maind
_pkgname="cro-${_appname}"
pkgname="${_pkgname}-bin"
pkgver=6.0.0
pkgrel=2
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_appname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}-${pkgver}/chain-main_${pkgver}-${pkgver}_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_appname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}-${pkgver}/chain-main_${pkgver}-${pkgver}_Linux_arm64.tar.gz")
#source_x86_64=("${_appname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
#source_aarch64=("${_appname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('77c67d8b4c2590054acac4a47f3be3af8078197be23484341b41e8b64d9ba560')
sha256sums_aarch64=('83b18243273889ed13171fe907d53ab3e6853a27fc5b4899a81a41e4eca2e089')

package() {
  install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}
