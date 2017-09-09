# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=1.1_beta.20170907
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-${_pkgver//_/-}.linux-amd64.tgz")
sha256sums=('2cd7eafcafd1083c39b2ba319005697cc018b6e3a73c3a7bb16813963ae64dcb')

package() {
  cd $srcdir/cockroach-${_pkgver//_/-}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
