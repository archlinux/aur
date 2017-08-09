# Maintainer: Antyradek <antyradek@protonmail.com>

pkgname=th
_reponame=tinyhead
pkgver=1.3.0
pkgrel=1
pkgdesc="Embed/pack binary file into C/C++ header"
arch=('i686' 'x86_64')
url="https://github.com/Antyradek/$_reponame"
license=('GPL')
depends=('popt')
makedepends=('gcc' 'make')
source=("https://github.com/Antyradek/$_reponame/archive/$pkgver.tar.gz")
md5sums=('a5022b9e07ccf85b1dac85e3512e1388')

build() {
	cd "$srcdir/$_reponame-$pkgver"
	make
}

package() {
	cd "$srcdir/$_reponame-$pkgver"
	make DESTDIR="$pkgdir" install
} 
