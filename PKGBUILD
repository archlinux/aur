# Maintainer: Andrew Kiss <ubervoltage@gmail.com>
pkgname=morsetran
pkgver=1.0
pkgrel=1
url="https://github.com/supervoltage/$pkgname"
pkgdesc="ASCII morse code translator"
arch=('i686' 'x86_64')
license=('GPL')
groups=('libstdc++')
makedepends=('make')
options=()
source=("https://dl.dropboxusercontent.com/u/29712116/C%2B%2B/morsetran-1.0.tar.gz")
noextract=()
md5sums=('f417493ab95681f5f0990ec7a5c89044')

build() {
	cd $srcdir
	
	make
}

package() {
	cd $srcdir
	
	make DESTDIR="$pkgdir/" install
}
