# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern _dot_ lindig _at_ googlemail _dot_ com

pkgname=pure-rational
pkgver=0.1
pkgrel=2
pkgdesc="A rational number library, originally written by Rob Hubbard for Q, ported to Pure by Jiri Spitz."
arch=('any')
license=('GPL3')
url="http://purelang.bitbucket.org/"
depends=('pure')
makedepends=()
groups=(pure-complete pure-math)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")

build() {
	cd $srcdir/$pkgname-$pkgver
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install || return 1
}
md5sums=('2c72ea03876f1142c2b954b59dbcbbac')
