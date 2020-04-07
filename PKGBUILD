# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=dexed-ide
pkgver=3.8.2
pkgrel=1
pkgdesc="IDE for the D programming language, its compilers, tools and libraries"
arch=(x86_64)
url="https://gitlab.com/basile.b/dexed"
license=('Boost')
depends=(dcd dscanner)
checkdepends=()
source=(https://gitlab.com/basile.b/dexed/-/jobs/499174438/artifacts/raw/setup/output/dexed.3.8.2.linux64.zip)
md5sums=('f4b494587f31d1296a96431fc5eaf5ca')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/dexed-x86_64/{dexed,dastworx} $pkgdir/usr/bin
}
