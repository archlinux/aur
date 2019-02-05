# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
pkgname=screen-sleep
pkgver=0.1
pkgrel=2
pkgdesc='Simple tool for shut down PC screen'
arch=('any')
url='https://gitlab.com/Fabi0Z/screen-sleep'
license=('GPL3')
depends=('bash')
source=("https://gitlab.com/Fabi0Z/$pkgname/raw/v$pkgver/$pkgname")
md5sums=('f0b0ea9a629ce28aa8e995402288dd23')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	install screen-sleep $pkgdir/usr/bin/$pkgname
}
