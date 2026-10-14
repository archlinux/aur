# vim:set ts=2 sw=2 et:
# Maintainer: Mahlon E. Smith <mahlon@martini.nu>

pkgname=pgdog-bin
_gitname=pgdog
pkgver=0.1.61
pkgrel=2
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
sha256sums=('b8ceb6b4e17cb7cb49b1dff122db8fa559a4cf94fc245d4d9415f9ae744011a7')

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp ${srcdir}/${_gitname}-v${pkgver}-${arch}-unknown-linux-gnu/pgdog "${pkgdir}/usr/bin"
}

