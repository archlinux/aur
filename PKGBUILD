# Mainainer: Eragon <eragon at eragon dot re>

pkgname="monetdb-openrc"
pkgver=11.53
pkgrel=1
pkgdesc="OpenRC start script for monetdb"
arch=(any)
licence=(GPL-3.0-or-later)
depends=("openrc" "monetdb")

source=(
	"monetdb.rc"
	"monetdb.conf"
)
sha256sums=(
	"d86a1f53fdd1629cf7178eb0160cdaf64a5af491ea84bf3e0eeb7009556a9873"
	"7bd6b838e68b07517f99e564cb97b1bf8d2aee12d4c3a247a1e402e1d66d65e7"
)

package() {
	install -Dm755 "$srcdir/monetdb.rc" "$pkgdir/etc/init.d/monetdb"
	install -Dm644 "$srcdir/monetdb.conf" "$pkgdir/etc/conf.d/monetdb"
}
