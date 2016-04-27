# Maintainer: Thor77 <thor77 at thor77 dot org>

pkgname=savilerow
pkgver=1.6.4
pkgrel=2
pkgdesc="A modelling assistant for CP"
arch=('i686' 'x86_64')
url="http://savilerow.cs.st-andrews.ac.uk"
license=('GPL')
depends=('java-runtime' 'minion')
source=("http://savilerow.cs.st-andrews.ac.uk/savilerow-$pkgver-linux.tgz" 'savilerow')
md5sums=('68e30793c72ac57b205aa760f9fc6977' 'd6ccd07cf5148aaac5e87f83bd866374')

package() {
	cd "$srcdir/savilerow-$pkgver-linux"
	install -d "$pkgdir/opt/$pkgname"
	install -d "$pkgdir/usr/bin"
	install -Dm 644 savilerow.jar $pkgdir/opt/$pkgname/
	cd "$srcdir"
	install -Dm 755 savilerow $pkgdir/usr/bin/
}
