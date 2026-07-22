# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# Contributor: Vincent B <vb@luminar.eu.org>

pkgname=ladybug-bin
_gitname=ladybug
pkgver=0.18.3
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
sha256sums=('7c5ffecc4c3b393b7c48439eac6403bd58a496876c2225d856ca534433bb207b'
            '1fa1297620cd7bb05975ced5e41be751b236dae91244979d3502d39295655d70')

package() {
  mkdir -p "${pkgdir}/usr/include" "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp ${srcdir}/lbug "${pkgdir}/usr/bin"
  cp -d ${srcdir}/liblbug.* "${pkgdir}/usr/lib"
  cp ${srcdir}/lbug.* "${pkgdir}/usr/include"
}

# vim:set ts=2 sw=2 et:
