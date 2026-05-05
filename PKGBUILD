# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# Contributor: Vincent B <vb@luminar.eu.org>

pkgname=ladybug-bin
_gitname=ladybug
pkgver=0.16.1
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
sha256sums=('55376880b3387b83a369d50a1859466c5cd02dd22f5cd8e664dcb5872b9049f2'
            '86e7faaf19f00e332e6527bf6fa3a234a870eebfdb41a86927a76bd15af3432b')

package() {
  mkdir -p "$pkgdir/usr/include" "$pkgdir/usr/lib" "$pkgdir/usr/bin"
  cp ${srcdir}/lbug "$pkgdir/usr/bin"
  cp ${srcdir}/liblbug.so "$pkgdir/usr/lib"
  cp ${srcdir}/lbug.* "$pkgdir/usr/include"
}

# vim:set ts=2 sw=2 et:
