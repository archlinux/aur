# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=dexed-ide
pkgver=3.9.4
pkgrel=1
pkgdesc="IDE for the D programming language, its compilers, tools and libraries"
arch=(x86_64)
url="https://gitlab.com/basile.b/dexed"
license=('Boost')
depends=(dcd dscanner)
checkdepends=()
source=(https://gitlab.com/basile.b/dexed/-/jobs/572632492/artifacts/raw/setup/output/dexed.$pkgver.linux64.zip)
md5sums=('d9646cff816913f3c625d3c6c890b78d')

package() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/dexed-x86_64/{dexed,dastworx} $pkgdir/usr/bin
}
