# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb
pkgver=20170126
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-beta-${pkgver}.linux-amd64.tgz")
sha256sums=('51459bfc5bc0b95f5e43245943eddc3b562d5765bbc5728a594226d6d9356169')

package() {
  cd $srcdir/cockroach-beta-${pkgver}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
