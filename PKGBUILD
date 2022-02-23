# Maintainer: charlottecross1998 <charlottecross2018@gmail.com>
# Maintainer: 

pkgname="prideflag"
pkgver=0.1
pkgrel=1
pkgdesc="Prideflags in your terminal!"
arch=("any")
url="https://github.com/CharlotteCross1998/prideflags"
license=('CCAN')
depends=('sudo')
makedepends=("git" "make" "gcc")
source=('https://raw.githubusercontent.com/CharlotteCross1998/prideflags/main/main.cpp' 'https://raw.githubusercontent.com/CharlotteCross1998/prideflags/main/Makefile')
md5sums=('SKIP' 'SKIP')
package() {
	cd "$srcdir"
	make install
}
