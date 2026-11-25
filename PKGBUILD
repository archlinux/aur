# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# Contributor: Vincent B <vb@luminar.eu.org>

pkgname=ladybug-bin
_gitname=ladybug
pkgver=0.23.0
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
sha256sums=('d7347ce7c2e5522741b1abeaeafa15e4f7e13920e57b15b5e3c29b4969918569'
            'a259d2010e83810f1f68bef91a6764e53daee4ea633b7d56657867f4f3143ce9')

package() {
  mkdir -p "${pkgdir}/usr/include" "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp ${srcdir}/lbug "${pkgdir}/usr/bin"
  cp -d ${srcdir}/liblbug.* "${pkgdir}/usr/lib"
  cp ${srcdir}/lbug.* "${pkgdir}/usr/include"
}

# vim:set ts=2 sw=2 et:
