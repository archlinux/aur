# Maintainer: Serge K <arch@phnx47.net>

_pkgbin=chain-maind
_pkgname="cro-${_pkgbin}"
pkgname="${_pkgname}-bin"
pkgdesc='Crypto.org Chain CLI'
pkgver=4.2.10
pkgrel=1
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgbin}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_pkgbin}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('3644230480720b277f951a1dc4fa0ff74920a0f5af871d3796138f3373514015')
sha256sums_aarch64=('38a03cad1aea3ef7c1d4a6b1e895f2bb34eaa2f9d51100a5236cb39c0fdf7262')

package() {
  install -Dm755 "bin/${_pkgbin}" "${pkgdir}/usr/bin/${_pkgbin}"
}
