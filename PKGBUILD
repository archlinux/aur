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
md5sums=('cc565b4a915ca5a366832a38fe3083e9')

build() {
	cd $srcdir/$pkgname-master
	
	make
}

package() {
	cd $srcdir/$pkgname-master
	
	mkdir -p $pkgdir/usr/bin
	make DESTDIR="$pkgdir" install
}
