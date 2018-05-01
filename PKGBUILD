# Maintainer: Dominik Heidler <dominik@heidler.eu>

pkgname=pa
pkgver=0.2
pkgrel=1
pkgdesc="Password manager similar to pass but with symmetric encryption"
arch=('any')
url="http://github.com/asdil12/pa"
license=('GPLv3')
groups=()
provides=()
depends=('python' 'python-gnupg' 'xclip')

source=("git://github.com/asdil12/$pkgname.git#tag=$pkgver")
md5sums=('SKIP')

package() {
	cd $srcdir/$pkgname
	make install DESTDIR=$pkgdir PREFIX=/usr
}
