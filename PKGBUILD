# Maintainer: Serge <arch@phnx47.net>

# Auto Upgrade: https://github.com/phnx47/pkgbuilds

_appname=chain-maind
_pkgname="cro-${_appname}"
pkgname="${_pkgname}-bin"
pkgver=8.0.1
pkgrel=1
pkgdesc='Crypto.org Chain CLI'
license=('Apache')
url='https://github.com/crypto-org-chain/chain-main'
arch=('x86_64' 'aarch64')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("${_appname}-${pkgver}-${arch[0]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_${arch[0]}.tar.gz")
source_aarch64=("${_appname}-${pkgver}-${arch[1]}.tar.gz::${url}/releases/download/v${pkgver}/chain-main_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('0e324b461d7c5ebf02d9eabb5e6018bb6dd4ba2d05ee30190ae2a0fae567ec0e')
sha256sums_aarch64=('257080801dc59fd676bdb901c43f84cf7536a1ed1793f79318fab2d8b9dfedb4')

package() {
  install -Dm755 "bin/${_appname}" "${pkgdir}/usr/bin/${_appname}"
}
