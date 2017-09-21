# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=1.1_beta.20170921
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-${_pkgver//_/-}.linux-amd64.tgz")
sha256sums=('6cce8d5b286f13d4622e4fcc4cdf381f8b7ae977c1741b9e7b0078c4c1d85d77')

package() {
  cd $srcdir/cockroach-${_pkgver//_/-}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
