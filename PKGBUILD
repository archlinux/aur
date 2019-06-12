# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=dexed-ide
pkgver=3.7.10
pkgrel=1
pkgdesc="IDE for the D programming language, its compilers, tools and libraries"
arch=(x86_64)
url="https://github.com/Basile-z/dexed"
license=('Boost')
depends=(dcd dscanner)
checkdepends=()
source=(https://github.com/Basile-z/dexed/releases/download/v$pkgver/dexed.$pkgver.linux64.zip)


package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/dexed-x86_64/{dexed,dastworx} $pkgdir/usr/bin
}
md5sums=('b2e6318715350ee39c7a81f729794d9b')
