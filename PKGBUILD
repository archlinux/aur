# Maintainer: Mahlon E. Smith <mahlon@martini.nu>
# Contributor: Vincent B <vb@luminar.eu.org>

pkgname=ladybug-bin
_gitname=ladybug
pkgver=0.19.1
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
sha256sums=('9e102b16877eff4700eb07f377ecb9dcf7546ea9fab341c0377d1366a1853f7b'
            'ed263ae913f68cb0ddba0b98548b58edaac49929766d03bdaaa83be46c68847d')

package() {
  mkdir -p "${pkgdir}/usr/include" "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp ${srcdir}/lbug "${pkgdir}/usr/bin"
  cp -d ${srcdir}/liblbug.* "${pkgdir}/usr/lib"
  cp ${srcdir}/lbug.* "${pkgdir}/usr/include"
}

# vim:set ts=2 sw=2 et:
