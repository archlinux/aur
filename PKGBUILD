# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# Contributor: Vincent B <vb@luminar.eu.org>

pkgname=ladybug-bin
_gitname=ladybug
pkgver=0.13.1
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
sha256sums=('098345f50c3c24aa5aeb4daf522c62c4184725eac245bab4c1bc77cbaee04b0d'
            'ce6387bd46a5bcecbf7d59608694c540274b6bfb690ea8e5c92d9cb373d73439')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/lbug "$pkgdir/usr/bin"
  cp ${srcdir}/liblbug.so "$pkgdir/usr/lib"
  cp ${srcdir}/lbug.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
