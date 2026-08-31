# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# Contributor: Vincent B <vb@luminar.eu.org>

pkgname=ladybug-bin
_gitname=ladybug
pkgver=0.20.1
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
sha256sums=('6b0632ee78493523d440c07664e09a227bec9470ff61eb9bca406e8028bb6120'
            '4b834824d430be9b87c1f704ba80a28652c93adf00fea65fa03a1d8d9ef73d85')

package() {
  mkdir -p "${pkgdir}/usr/include" "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp ${srcdir}/lbug "${pkgdir}/usr/bin"
  cp -d ${srcdir}/liblbug.* "${pkgdir}/usr/lib"
  cp ${srcdir}/lbug.* "${pkgdir}/usr/include"
}

# vim:set ts=2 sw=2 et:
