# Maintainer: Daniel Lima <danielm@tinyhub.tk>

pkgname=luas
pkgver=0.2
pkgrel=1
pkgdesc='Lua environment manager'
arch=('i686' 'x86_64')
url='https://github.com/limadm/luas'
license=('MIT')
source=(git+https://github.com/limadm/luas)
sha256sums=('SKIP')

package() {
	cd $srcdir/luas
	PREFIX=$pkgdir ./install.sh
}

