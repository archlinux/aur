# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb
pkgver=20161215
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-beta-${pkgver}.linux-amd64.tgz")
sha256sums=('12c8f6b1519607d5b88b33a2da032964721bbfa599dabbd7cf8d7b2a4e45fe80')

package() {
  cd $srcdir/cockroach-beta-${pkgver}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
