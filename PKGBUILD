# Mainainer: Eragon <eragon at eragon dot re>

pkgname="monetdb-openrc"
pkgver=11.53.13
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
	"7976b9ec89d3ba6566f5210b3620c77927c231a2bb0645e42db6c04d1fba7455"
	"7bd6b838e68b07517f99e564cb97b1bf8d2aee12d4c3a247a1e402e1d66d65e7"
)

package() {
	install -Dm755 "$srcdir/monetdb.rc" "$pkgdir/etc/init.d/monetdb"
	install -Dm644 "$srcdir/monetdb.conf" "$pkgdir/etc/conf.d/monetdb"
}
