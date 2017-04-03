# Maintainer: Andrew Kiss <ubervoltage@gmail.com>
pkgname=morsetran
pkgver=1.1
pkgrel=3
url="https://github.com/supervoltage/$pkgname"
pkgdesc="ASCII morse code translator"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
license=('GPL')
groups=('libstdc++')
makedepends=('make')
options=()
source=("https://github.com/supervoltage/morsetran/archive/master.zip")
noextract=()
md5sums=('4d57ece3eb7e141bf3074e3f8c345102')

build() {
	cd $srcdir/$pkgname-master
	
	make
}

package() {
	cd $srcdir/$pkgname-master
	
	make DESTDIR="$pkgfir/" install
}
