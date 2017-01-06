# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb
pkgver=20170105
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-beta-${pkgver}.linux-amd64.tgz")
sha256sums=('0e3a6b4830cde0b4d3a603ac783ebd9eccacc4837909285d275380a840bc1079')

package() {
  cd $srcdir/cockroach-beta-${pkgver}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
