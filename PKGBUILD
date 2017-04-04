# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=lotw
pkgver=20170402
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
md5sums=('8bc9041e46ee6e439299eb6479b14044')
sha256sums=('4d551b3ea8ebddf924d89b40ba347c6f15a5ca4a84e665f4d19947b3166994bf')
