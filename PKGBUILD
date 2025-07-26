# Maintainer: iamawacko <iamawacko@protonmail.com>
# contributor: sin
pkgname=solang-bin
_pkgname=solang
pkgver=0.3.4
pkgrel=1
pkgdesc='A Solidity to wasm compiler written in rust'
url='https://github.com/hyperledger-labs/solang'
arch=('x86_64')
options=(!strip)
license=('Apache')
source=("${_pkgname}::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x86-64")
depends=('gcc-libs' 'zlib')
sha256sums=('6af67bb9ff22f539c2ebc9f8b3cc7094ad790bf10466d9ccd22fa0502c3a065d')

package() {
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
}

