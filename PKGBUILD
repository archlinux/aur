# Maintainer: Daniel Lima <danielm@tinyhub.tk>

pkgname=luas
pkgver=0.5
pkgrel=1
pkgdesc='Lua environment manager'
arch=('i686' 'x86_64')
url='https://github.com/limadm/luas'
license=('MIT')
source=(git+https://github.com/limadm/luas)
sha256sums=('SKIP')

package() {
	cd $srcdir/luas
	make install PREFIX=$pkgdir/usr
}

