# Maintainer: Alfred Roos alfred@stensatter.se
pkgname=ArrayList
pkgver=1
pkgrel=1
pkgdesc="Dynamic array list simular to javas ArrayList in c"
arch=(x86_64)
url="https://github.com/spynetS/ArrayList"
license=('MIT')
makedepends=(gcc git)
source=( "git+$url.git" )
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd $pkgname
	./build.sh
}

package() {
	cd $pkgname
	cd build
	install -Dm755 "./libarraylist.so" "$pkgdir/usr/lib/libarraylist.so"
	install -Dm655 "./arraylist.h" "$pkgdir/usr/include/arraylist.h"
}
              
