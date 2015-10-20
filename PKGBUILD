# Maintainer: David Schury <dasc@posteo.de>
pkgname=bug
pkgver=1.1
pkgrel=1
pkgdesc="commandline todo-tracking system"
arch=('any')
url="http://vicerveza.homeunix.net/~viric/soft/bug/"
license=('GPL')
source=("http://vicerveza.homeunix.net/~viric/soft/$pkgname/$pkgname.gz")
md5sums=('90c3ebf2753168332779e1a0e2740507')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $pkgname $pkgdir/usr/bin
	chmod 755 $pkgdir/usr/bin/$pkgname
}
