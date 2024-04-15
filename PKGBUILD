# Maintainer: Serge K <arch@phnx47.net>

# For Issues, Pull Requests
# https://github.com/phnx47/pkgbuilds

_pkgbin=chain-maind
_pkgname="cro-${_pkgbin}"
pkgname="${_pkgname}-bin"
pkgdesc='Crypto.org Chain CLI'
pkgver=4.2.9
pkgrel=1
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgbin}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_pkgbin}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('6f9f36330ea89fa4f9f82905c756104cd4012a1378a97c2d62c3d79669df2ff1')
sha256sums_aarch64=('d76ed85bfb90a1a882a5872f047edd9f6a438af74578517bdd931a325f3e7328')

package() {
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
}
