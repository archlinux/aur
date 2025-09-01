# Maintainer: Serge K <arch@phnx47.net>

_appname=chain-maind
_pkgname="cro-${_appname}"
pkgname="${_pkgname}-bin"
pkgver=6.0.2
pkgrel=1
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_appname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_appname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('ecbfaa68f706ca11869823de41b19693dfe9c0996ceaa5555a090f26b063f32d')
sha256sums_aarch64=('e12b7c2d6278c3ff5a73706402f15d4bff6355dd3d98061b81ccfe2f309cfed0')

package() {
  install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}
