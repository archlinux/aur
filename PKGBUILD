# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=v1.1_alpha.20170608
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-${pkgver//_/-}.linux-amd64.tgz")
sha256sums=('622923c8919d7b56a8c32fa2a7c157014fb0ed733f65a049b4e4fa22f4913572')

package() {
  cd $srcdir/cockroach-${pkgver//_/-}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
