# Maintainer: Marcel O'Neil <marcel@marceloneil.com>

pkgname=cockroachdb
pkgver=20161201
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs')
source=("https://binaries.cockroachdb.com/cockroach-beta-${pkgver}.linux-amd64.tgz")
sha256sums=('f6a8edec4c06eb9499c71b3b68dc2b03bea20d56e15ba108ab487896d8a65447')

package() {
  cd $srcdir/cockroach-beta-${pkgver}.linux-amd64/
  install -Dm755 cockroach "${pkgdir}/usr/bin/cockroach"
}
