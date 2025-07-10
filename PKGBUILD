# Maintainer: Serge K <arch@phnx47.net>

_appname=chain-maind
_pkgname="cro-${_appname}"
pkgname="${_pkgname}-bin"
pkgver=6.0.0
pkgrel=3
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_appname}-${pkgver}-2-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}-2/chain-main_${pkgver}-2_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_appname}-${pkgver}-2-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}-2/chain-main_${pkgver}-2_Linux_arm64.tar.gz")
#source_x86_64=("${_appname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
#source_aarch64=("${_appname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('fe31f7332fff8345430ffa2a318ff7b4e6e72c7b32ba2dc94d08ebf1e79ded07')
sha256sums_aarch64=('e79a1e285d13d02d92e60a5a9a439836d4c559fa9e1dcd79c8c84c712498cfe9')

package() {
  install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}
