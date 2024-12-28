# Maintainer: devome <evinedeng@hotmail.com>

pkgname=hoarder-cli
pkgver=0.20.0
pkgrel=1
pkgdesc="Command Line Interface (CLI) for Hoarder"
arch=("any")
url="https://github.com/hoarder-app/hoarder"
license=('AGPL-3.0-or-later')
depends=("nodejs")
makedepends=("npm")
source=("${pkgname}-${pkgver}.tgz::https://registry.npmjs.org/@hoarderapp/cli/-/cli-${pkgver}.tgz")
sha256sums=('1ca03658f904006565eca565a156b5ef48c75787095ca1d6b22b305d38f3d818')
noextract=("${pkgname}-${pkgver}.tgz")

package() {
    npm install --cache "cache" --global --prefix="${pkgdir}/usr" "${pkgname}-${pkgver}.tgz"
}
