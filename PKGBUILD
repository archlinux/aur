# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=1.1_alpha.20170817
_pkgver="v${pkgver}"
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-${_pkgver//_/-}.linux-amd64.tgz")
sha256sums=('7219c24bf7b3c29be2cc8ee662e0b250e844e48023277c000b8304b57e9d4499')

package() {
  cd $srcdir/cockroach-${_pkgver//_/-}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
