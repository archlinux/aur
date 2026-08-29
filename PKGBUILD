# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# Contributor: Vincent B <vb@luminar.eu.org>

pkgname=ladybug-bin
_gitname=ladybug
pkgver=0.20.0
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
sha256sums=('5c1caf51b54a17c53d44fd24c9fc3e0decdb9d125f3906619f6a833e2f633b31'
            '51b8cc204833523f2191ccabf15c7e0825dd94ab3dc547b87a44cde1106da8bf')

package() {
  mkdir -p "${pkgdir}/usr/include" "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp ${srcdir}/lbug "${pkgdir}/usr/bin"
  cp -d ${srcdir}/liblbug.* "${pkgdir}/usr/lib"
  cp ${srcdir}/lbug.* "${pkgdir}/usr/include"
}

# vim:set ts=2 sw=2 et:
