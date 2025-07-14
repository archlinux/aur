# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=kuzu-bin
_gitname=kuzu
pkgver=0.11.0
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
sha256sums=('e465db592a3c77b16ca58b7e95b03a44b6637a53a70f94907fb29590f754d52d'
            '94b7667628d861d9232d941549b7caa767065644aeda2dd42c24db4bbd273144')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/${_gitname} "$pkgdir/usr/bin"
  cp ${srcdir}/libkuzu.so "$pkgdir/usr/lib"
  cp ${srcdir}/kuzu.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
