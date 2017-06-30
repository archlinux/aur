# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=v1.1_alpha.20170629
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-${pkgver//_/-}.linux-amd64.tgz")
sha256sums=('bd7613a809eafae60e30b4668f2585f252f53ea2b2a7810ae2fab28fa67574f9')

package() {
  cd $srcdir/cockroach-${pkgver//_/-}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
