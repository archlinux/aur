# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=kuzu-bin
_gitname=kuzu
pkgver=v0.4.2
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
source=("https://github.com/kuzudb/kuzu/releases/download/${pkgver}/kuzu_cli-linux-x86_64.tar.gz"
        "https://github.com/kuzudb/kuzu/releases/download/${pkgver}/libkuzu-linux-x86_64.tar.gz")
sha256sums=('e77600afd326531e7e7d9b7508fe545ed518e431d7e9a0e93f8960ae0c8f51bf'
            '42ad82c09ab6ff0e7e18ece8c462758cae062eb7303bed9d64d073b488692354')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/${_gitname} "$pkgdir/usr/bin"
  cp ${srcdir}/libkuzu.so "$pkgdir/usr/lib"
  cp ${srcdir}/kuzu.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
