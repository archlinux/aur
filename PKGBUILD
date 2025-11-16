# Maintainer: Vincent B <vb@luminar.eu.org>

pkgname=ladybug-bin
_gitname=ladybug
pkgver=0.12.2
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
sha256sums=('51515680414296134bb9818b948954aec9a2301d615be70db7bfb06953d469b0'
            '34137ca1a280378c23ee1cdf8a00e76e28d5a3602119e6a72d0a21074a2670f6')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/lbug "$pkgdir/usr/bin"
  cp ${srcdir}/liblbug.so "$pkgdir/usr/lib"
  cp ${srcdir}/lbug.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
