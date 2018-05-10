# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=ripabook
pkgver=0.2
pkgrel=2
pkgdesc="Tool to ripp audiobooks"
arch=(any)
url="https://github.com/asdil12/ripabook"
license=('GPL')
groups=()
provides=()
depends=('python2' 'cdparanoia' 'lame')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/asdil12/ripabook/tar.gz/$pkgver")
md5sums=('a63b7d3abe4671b3e6ee7ec4ad5d1859')

package() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --optimize=1 --prefix=/usr --root=$pkgdir
}
