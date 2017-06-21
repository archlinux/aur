# Maintainer: Daniel Lima <danielm@nanohub.tk>

pkgname=luas
pkgver=0.7
pkgrel=1
pkgdesc='Lua environment manager'
arch=('i686' 'x86_64')
url='https://github.com/limadm/luas'
license=('MIT')
source=(git+https://github.com/limadm/luas)
md5sums=('SKIP')

pkgver() {
	cd $srcdir/luas
	git describe --tags
}

package() {
	cd $srcdir/luas
	make install PREFIX=$pkgdir/usr
}

