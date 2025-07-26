# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=kuzu-bin
_gitname=kuzu
pkgver=0.11.1
pkgrel=1
epoch=
pkgdesc="In-process property graph database management system (GDBMS) built for query speed and scalability"
arch=('x86_64')
url="https://kuzudb.com"
license=('MIT')
groups=()
depends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/kuzudb/kuzu/releases/download/v${pkgver}/kuzu_cli-linux-x86_64.tar.gz"
        "lib${pkgname}-v${pkgver}.tar.gz::https://github.com/kuzudb/kuzu/releases/download/v${pkgver}/libkuzu-linux-x86_64.tar.gz")
sha256sums=('6e09bb4819c88fab2438137cb1089ac40794023e7c04ab5ab23a8764830e581b'
            '9c2a90eb77741882909af6377130093ef690aa3642ae0af560707b11d4281f7c')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/${_gitname} "$pkgdir/usr/bin"
  cp ${srcdir}/libkuzu.so "$pkgdir/usr/lib"
  cp ${srcdir}/kuzu.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
