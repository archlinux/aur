# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb-bin
conflicts=('cockroachdb')
provides=('cockroachdb')
pkgver=1.0
pkgrel=2
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-v${pkgver}-rc.${pkgrel}.linux-amd64.tgz")
sha256sums=('32982d258f09f709b429562fc73da32004a9941ec8c09c15f19438faf248106c')

package() {
  cd $srcdir/cockroach-v${pkgver}-rc.${pkgrel}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
