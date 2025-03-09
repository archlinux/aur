# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=kuzu-bin
_gitname=kuzu
pkgver=v0.8.2
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kuzudb/kuzu/releases/download/${pkgver}/kuzu_cli-linux-x86_64.tar.gz"
        "lib${pkgname}-${pkgver}.tar.gz::https://github.com/kuzudb/kuzu/releases/download/${pkgver}/libkuzu-linux-x86_64.tar.gz")
sha256sums=('7e6096de9254391efe355cdf4da26cb54db97673adfecbe5207b04cef6815e92'
            '820ac0394cb912c76580e4b907807a596fac7f4cc374fdaddb223a118a045407')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/${_gitname} "$pkgdir/usr/bin"
  cp ${srcdir}/libkuzu.so "$pkgdir/usr/lib"
  cp ${srcdir}/kuzu.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
