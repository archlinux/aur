# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=dexed-ide
pkgver=3.7.9
pkgrel=1
pkgdesc="IDE for the D programming language, its compilers, tools and libraries"
arch=(x86_64)
url="https://github.com/Basile-z/dexed"
license=('Boost')
depends=(dcd dscanner)
checkdepends=()
source=(https://github.com/Basile-z/dexed/releases/download/v3.7.9/dexed.3.7.9.linux64.zip)
md5sums=('40abfb1d72f22de77338098a155ce14c')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/dexed-x86_64/{dexed,dastworx} $pkgdir/usr/bin
}
