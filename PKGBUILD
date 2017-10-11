# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=1.1.0_rc.1
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-${_pkgver//_/-}.linux-amd64.tgz")
sha256sums=('5a3e60dc971c18ee96849c7b231f4a45320790a60bd3dadbc32fa16dd03f328e')

package() {
  cd $srcdir/cockroach-${_pkgver//_/-}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
