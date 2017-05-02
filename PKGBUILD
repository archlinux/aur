# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=1.0
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-v${pkgver}-rc.${pkgrel}.linux-amd64.tgz")
sha256sums=('584492dd92fa805781d4ebfd25d2ab5800859053405c13a3ef18519096a6b4b3')

package() {
  cd $srcdir/cockroach-v${pkgver}-rc.${pkgrel}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
