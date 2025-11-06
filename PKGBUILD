# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=ladybug-bin
_gitname=ladybug
pkgver=0.12.0
pkgrel=1
epoch=
pkgdesc="In-process property graph database management system (GDBMS) built for query speed and scalability"
arch=('x86_64')
url="https://ladybugdb.com"
license=('MIT')
groups=()
depends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=('kuzu-bin')
backup=()
options=()
install=
changelog=
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/ladybugdb/ladybug/releases/download/v${pkgver}/lbug_cli-linux-x86_64.tar.gz"
        "lib${pkgname}-v${pkgver}.tar.gz::https://github.com/ladybugdb/ladybug/releases/download/v${pkgver}/liblbug-linux-x86_64.tar.gz")
sha256sums=('4a38cf3db922abfafaa91b1f18fa298fbe25cb5fce540d08cf42a5d9bd8ff388'
            'c013d5705bb6d7059b85d232413cec673799f39223092e6ac8e066ebb6012977')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/lbug "$pkgdir/usr/bin"
  cp ${srcdir}/liblbug.so "$pkgdir/usr/lib"
  cp ${srcdir}/lbug.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
