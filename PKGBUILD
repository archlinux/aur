# All credit and criticisms can be directed to Aelius @ Freenode

pkgname=dctl
pkgver=1
pkgrel=1
pkgdesc="A dmenu wrapper for basic systemctl commands"
arch=('any')
depends=('dmenu')
source=('dctl' 'daskpass')
md5sums=('10fc7a84cbe8ee2d6764f8b477ca93f2'
	 'a207fd7e4f2402027ef53aa464d8b9ac')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	install -v -m755 dctl "$pkgdir/usr/bin/dctl"
	install -m755 daskpass "$pkgdir/usr/bin/daskpass"
}
