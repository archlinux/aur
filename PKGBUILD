# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=lotw
pkgver=20170114
pkgrel=1
pkgdesc="The unofficial ARRL-LOTW users list"
arch=('any')
url="http://www.hb9bza.net/lotw-users-list"
license=('unknown')
source=(http://www.hb9bza.net/$pkgname/${pkgname}.txt)

package() {
	cd $srcdir

	install -Dm644 $srcdir/$pkgname.txt $pkgdir/usr/share/$pkgname/$pkgname.txt
}
md5sums=('3362c1ff5a797b41363561d50ab188ab')
sha256sums=('d24d708f73db9f76eefe7035dd1590f639d2269ffedffc261499a9edba25ba3f')
