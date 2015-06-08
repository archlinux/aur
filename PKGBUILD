# Maintainer: Dominik Heidler <dheidler@gmail.com>

pkgname=ripabook
pkgver=0.1
pkgrel=2
pkgdesc="Tool to ripp audiobooks"
arch=(any)
url="https://github.com/asdil12/ripabook"
license=('GPL')
groups=()
provides=()
depends=('python2' 'cdparanoia' 'lame')

source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/asdil12/ripabook/tar.gz/$pkgver")
md5sums=('972d617be0896b794190ee4b94bf9b65')

package() {
	cd $srcdir/$pkgname-$pkgver
	python2 setup.py install --optimize=1 --prefix=/usr --root=$pkgdir
}
