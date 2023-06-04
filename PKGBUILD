# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname="cro-${_pkgbin}"
pkgname="${_pkgname}-bin"
pkgdesc='Crypto.org Chain CLI'
pkgver=4.2.5
pkgrel=2
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgbin}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_pkgbin}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('acbc7c3fd1a1c1761f0e51e5bb49be24fea1fd0c708aedbdf74484aeb52c19ea')
sha256sums_aarch64=('8365f80430324f1feb0fb699fd9447e6a5191b120387b76081ee53e36d97bb76')

package() {
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
}
