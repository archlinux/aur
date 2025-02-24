# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=kuzu-bin
_gitname=kuzu
pkgver=v0.8.1
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
sha256sums=('9f5e27f93b8eb26d81beb89c92289920f2e1013b2c92a668d84a390e6844bfdc'
            '647510ecd3a4b9c242284ba9369609ec22689197f250544580f07e5595c5cd45')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/${_gitname} "$pkgdir/usr/bin"
  cp ${srcdir}/libkuzu.so "$pkgdir/usr/lib"
  cp ${srcdir}/kuzu.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
