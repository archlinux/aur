# vim:set ts=2 sw=2 et:
# Maintainer: Mahlon E. Smith <mahlon@martini.nu>

pkgname=pgdog-bin
_gitname=pgdog
pkgver=0.1.64
pkgrel=1
epoch=
pkgdesc="PostgreSQL connection pooler, load balancer and database sharder."
arch=('x86_64')
url="https://pgdog.dev/"
license=('AGPL-3.0')
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
source=("${_gitname}-v${pkgver}.tar.gz::https://github.com/pgdogdev/pgdog/releases/download/v${pkgver}/${_gitname}-v${pkgver}-${arch}-unknown-linux-gnu.tar.gz")
sha256sums=('e4f06f76cb3245f877790dfc942c5394015e2ad9fb2f8cd3cbb7b9425ae28e05')

package() {
  srcpath="${srcdir}/${_gitname}-v${pkgver}-${arch}-unknown-linux-gnu"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pgdog"
  cp ${srcpath}/README.md "${pkgdir}/usr/share/pgdog/"
  cp ${srcpath}/pgdog "${pkgdir}/usr/bin/"
}

