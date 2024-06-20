# Maintainer: Alejandro Virelles <thesnakewitcher@gmail.com>
_pkgname=graph-cli
pkgname=thegraph-cli
pkgver=0.75.0
pkgrel=1
pkgdesc="CLI for building and deploying to The Graph protocol"
arch=('x86_64')
url="https://github.com/graphprotocol/graph-tooling/tree/main/packages/cli"
license=('MIT')
depends=(libsecret)
makedepends=(npm)
noextract=("${_pkgname}-${pkgver}.tgz")
provides=(graph)
source=("https://registry.npmjs.org/@graphprotocol/$_pkgname/-/$_pkgname-$pkgver.tgz")
sha256sums=('bb0983b4642f1309b8455a015b5c2ccc5ee628398e669414d339d0d963b3c052')

package() {
    npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tgz"
}
