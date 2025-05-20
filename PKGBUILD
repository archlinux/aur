# Maintainer: charlottecross1998 <charlottecross2018@gmail.com>
# Maintainer: 

pkgname="prideflag-git"
pkgver=0.1
pkgrel=1
pkgdesc="Prideflags in your terminal!"
arch=("any")
url="https://github.com/CharlotteCross1998/prideflags"
license=('CCAN')
makedepends=("git" "make" "gcc")
source=('https://raw.githubusercontent.com/CharlotteCross1998/prideflags/main/main.cpp' 'https://raw.githubusercontent.com/CharlotteCross1998/prideflags/main/Makefile')
md5sums=('SKIP' 'SKIP')
build() 
{
	cd "$srcdir"
	make
}
package()
{
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/prideflag $pkgdir/usr/bin
}
