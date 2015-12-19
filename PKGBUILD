# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern _dot_ lindig _at_ googlemail _dot_ com

pkgname=pure-octave
pkgver=0.7
pkgrel=2
pkgdesc="embed an Octave interpreter into Pure."
arch=("i686" "x86_64")
license=('GPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'octave')
makedepends=()
groups=(pure-complete pure-math)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
sha1sums=('0af1c4dc5731f336c33d999560bd34b3eeb6cbf5')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install 
}
