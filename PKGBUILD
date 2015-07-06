# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=lotw
pkgver=20150222
pkgrel=1
pkgdesc="The unofficial LOTW users list"
arch=('any')
url="http://www.hb9bza.net/lotw-users-list"
license=('unknown')
source=(http://www.hb9bza.net/$pkgname/${pkgname}.txt)

package() {
	cd $srcdir

	install -Dm644 $srcdir/$pkgname.txt $pkgdir/usr/share/$pkgname/$pkgname.txt
}
md5sums=('709ba9b6c43c9fe01789cca090002785')
sha256sums=('7c06c7c0f8c895332248960966495ee00861f8a561f6a7f29090451f0ee5add8')
