# Maintainer: Sebastiaan de Schaetzen <sebastiaan.de.schaetzen@gmail.com>
pkgname=dexed-ide-bin
pkgver=3.9.11
pkgrel=1
pkgdesc="IDE for the D programming language, its compilers, tools and libraries"
arch=(x86_64)
url="https://gitlab.com/basile.b/dexed"
license=('Boost')
depends=(dcd dscanner)
checkdepends=()
source=(https://gitlab.com/basile.b/dexed/-/releases/v$pkgver/downloads/binaries/dexed.$pkgver.linux64.zip)
md5sums=('9485d86edc687ad6c00d3eb384aaf184')

package() {
	install -dm755 $pkgdir/usr/{bin,lib}
	install -m755 $srcdir/dexed-x86_64/dexed $pkgdir/usr/bin
	install -m644 $srcdir/dexed-x86_64/libdexed-d.so $pkgdir/usr/lib
}
