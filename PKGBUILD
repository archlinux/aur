# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
pkgname=screen-sleep
pkgver=0.3
pkgrel=1
pkgdesc='Simple tool for shut down PC screen'
arch=('any')
url='https://gitlab.com/eathtespagheti/screen-sleep'
license=('GPL3')
depends=('bash')
source=("https://gitlab.com/eathtespagheti/$pkgname/raw/v$pkgver/$pkgname")
md5sums=('f24a67449d5650cae67b9273cff62358')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	install screen-sleep $pkgdir/usr/bin/$pkgname
}
