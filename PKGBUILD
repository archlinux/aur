# Maintainer: Antyradek <antyradek@protonmail.com>

pkgname=th
_reponame=tinyhead
pkgver=1.2.0
pkgrel=1
pkgdesc="Embed/pack binary file into C/C++ header"
arch=('i686' 'x86_64')
url="https://github.com/Antyradek/$_reponame"
license=('GPL')
depends=('popt')
makedepends=('gcc' 'make')
source=("https://github.com/Antyradek/$_reponame/archive/$pkgver.tar.gz")
md5sums=('a98bd7bc5405f78f8fd4086ec20ac84e')


build() {
	cd "$srcdir/$_reponame-$pkgver"
	make
}

package() {
	cd "$srcdir/$_reponame-$pkgver"
	make DESTDIR="$pkgdir" install
} 
