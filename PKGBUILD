# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=v1.1_alpha.20170713
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-${pkgver//_/-}.linux-amd64.tgz")
sha256sums=('7f37a5e33595ea4a11beb0faf8aa284af0f9ceafe0f0a5577a5d53d4b4b4885c')

package() {
  cd $srcdir/cockroach-${pkgver//_/-}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
