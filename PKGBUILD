# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern _dot_ lindig _at_ googlemail _dot_ com

pkgname=pure-octave
pkgver=0.6
pkgrel=1
pkgdesc="embed an Octave interpreter into Pure."
arch=("i686" "x86_64")
license=('GPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'octave')
makedepends=()
groups=(pure-complete pure-math)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('24e92f43b1315263a570f3a3be1c77866b5c395a')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install 
}
