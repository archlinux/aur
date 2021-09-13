# Maintainer: sin
pkgname=solang-bin
_pkgname=solang
pkgver=0.1.8
pkgrel=1
pkgdesc='A Solidity to wasm compiler written in rust'
url='https://github.com/hyperledger-labs/solang'
arch=('x86_64')
options=(!strip)
license=('Apache')
source=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux")
depends=('gcc-libs' 'zlib')
sha256sums=('faa7b36a3f3eb3fa1847455a1e7b56dd1b9c32d87921f390ead730841c38a8a1')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

