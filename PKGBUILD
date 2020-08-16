# Maintainer: Samuel Dudík <dudik at tutanota dot com>
_pkgname=herbe
pkgname=$_pkgname-git
pkgver=1
pkgrel=1
arch=(any)
license=('MIT')
makedepends=('git')
url="https://github.com/dudik/$_pkgname"
source=("git+https://github.com/dudik/$_pkgname.git")
md5sums=('SKIP')

build () {
	cd "$_pkgname"
	make
}

package () {
	cd "$_pkgname"
	cp $_pkgname $pkgdir$prefix
}
