# Maintainer: alastair pharo  asppsa at gmail dot com
# Contributor: Bjoern Lindig bjoern _dot_ lindig _at_ googlemail _dot_ com

pkgname=pure-octave
pkgver=0.12
pkgrel=1
pkgdesc="embed an Octave interpreter into Pure."
arch=("i686" "x86_64")
license=('GPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'octave')
makedepends=()
groups=(pure-complete pure-math)
source=("https://github.com/agraef/pure-lang/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha1sums=('1a3a9d3626daa8a5227759ee3f6e8ad8d3aaa99e')

build() {
	cd $srcdir/$pkgname-$pkgver
	make
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir install 
}
