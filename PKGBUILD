# Contributor: SanskritFritz (gmail)

pkgname=gtd-free
pkgver=0.6beta
_pkgver=0.6-beta
pkgrel=3
pkgdesc="Personal TODO/action manager inspired by GTD (Getting Things Done) method by David Allen."
arch=('any')
url='http://gtd-free.sourceforge.net/'
license=('GPL')
depends=('java-runtime')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$_pkgver.jar" $pkgname.sh GTD-Free.desktop)
md5sums=('cab7f444102878e3571f8418b96bd42d'
         'b03000546f90b83cb1da29dd44e78191'
         '73ee2f5da892a4bc3abbad56b314f53e')
package() {
	cd "$srcdir"

	install -Dm644 "$pkgname-$_pkgver.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	install -Dm644 GTD-Free.desktop "$pkgdir/usr/share/applications/GTD-Free.desktop"
	install -Dm644 splash96.png "$pkgdir/usr/share/pixmaps/gtd-free96.png"
}

