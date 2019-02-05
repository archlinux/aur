# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
pkgname=screen-sleep
pkgver=0.1
pkgrel=1
pkgdesc='Simple tool for shut down PC screen'
arch=('any')
url='https://gitlab.com/Fabi0Z/screen-sleep'
license=('GPL3')
depends=('bash')
source=('https://gitlab.com/Fabi0Z/screen-sleep/raw/master/screen-sleep')
md5sums=('e0737560bc791933deef5e69cb1e3552')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	install screen-sleep $pkgdir/usr/bin/$pkgname
}
