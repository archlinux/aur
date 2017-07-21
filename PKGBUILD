# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=v1.1_alpha.20170720
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-${pkgver//_/-}.linux-amd64.tgz")
sha256sums=('472114ac9dd57c4dec64943970edfdc097d8fc33d3aa3d2d16df90fe55c1e0da')

package() {
  cd $srcdir/cockroach-${pkgver//_/-}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
