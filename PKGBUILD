# Maintainer: Fabio Sussarellu <sussarellu.fabio@gmail.com>
pkgname=ittirish-names
pkgver=0.2
pkgrel=1
pkgdesc="Generate random names from people in Ittiri's city!"
arch=('any')
url='https://gitlab.com/slashpark/generatore-nomi-ittiresi'
license=('GPL3')
depends=('wget' 'ruby')
source=("https://gitlab.com/slashpark/generatore-nomi-ittiresi/raw/v$pkgver/$pkgname")
md5sums=('4130a415c760e02f3995b27f658e834c')

package() {
	cd $srcdir
	mkdir -p $pkgdir/usr/bin
	install ittirish-names $pkgdir/usr/bin/$pkgname
}
