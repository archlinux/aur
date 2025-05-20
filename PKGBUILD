# Maintainer: Charlotte (Github: charlottecross1998)
pkgname=configparser-git
pkgver=0.1.0
pkgrel=1.0
pkgdesc="Simple, lightweight C++ configuration/ini file parser for Linux. "
arch=("x86_64")
url="https://github.com/dzilles/configparser"
license=("BSD-2-Clause")
makedepends=("git" "cmake" "make")
source=("git+https://github.com/dzilles/configparser.git")
b2sums=('SKIP')
build()
{
	cd configparser
	cmake .
	make
}
package()
{
	cd configparser
	make DESTDIR="$pkgdir install"	
}
