# All credit and criticisms can be directed to Aelius @ Freenode

pkgname=dctl
pkgver=2
pkgrel=1
pkgdesc="A dmenu wrapper for basic systemctl commands"
arch=('any')
depends=('dmenu')
source=('dctl' 'daskpass')
md5sums=('160b4c14399a498e9bdf12859f78f5a3'
         '12e77a29fd27b49ead7cbb48b808b6c8')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	install -m755 dctl "$pkgdir/usr/bin/dctl"
	install -m755 daskpass "$pkgdir/usr/bin/daskpass"
}
