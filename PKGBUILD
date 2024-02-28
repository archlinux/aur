# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=lotw
pkgver=20240225
pkgrel=1
pkgdesc="The unofficial ARRL-LOTW users list"
arch=('any')
url="http://www.hb9bza.net/lotw-users-list"
source=(http://www.hb9bza.net/$pkgname/${pkgname}.txt)

package() {
	cd $srcdir

	install -Dm644 $srcdir/$pkgname.txt $pkgdir/usr/share/$pkgname/$pkgname.txt
}
md5sums=('40311808f17f6f17a85617e1fd289255')
sha256sums=('6c0b3a95692c2e396be4cf6dc4ca485e9f0968ff208abcdc9bfe9fc035bddec3')
