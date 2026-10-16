# vim:set ts=2 sw=2 et:
# Maintainer: Mahlon E. Smith <mahlon@martini.nu>

pkgname=pgdog-bin
_gitname=pgdog
pkgver=0.1.62
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
sha256sums=('398151545bcc47b54b364099aeb67a07613d3655cc54ab807a4bccce585bd10b')

package() {
  srcpath="${srcdir}/${_gitname}-v${pkgver}-${arch}-unknown-linux-gnu"
  mkdir -p "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pgdog"
  cp ${srcpath}/README.md "${pkgdir}/usr/share/pgdog/"
  cp ${srcpath}/pgdog "${pkgdir}/usr/bin/"
}

