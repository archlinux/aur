# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=1.2_alpha.20171026
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs' 'libtinfo5')
source=("https://binaries.cockroachdb.com/cockroach-${_pkgver//_/-}.linux-amd64.tgz")
sha256sums=('5de33553aa4be79c7fb05fa44f677706df78c283ae00f917d09e0cb2359dcc19')

package() {
  cd $srcdir/cockroach-${_pkgver//_/-}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
