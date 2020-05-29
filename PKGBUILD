# Maintainer: johnnybash <georgpfahler[at]wachenzell[dot]org>
# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Contributor: Lukas Sabota [prg318] <LTsmooth42[at]gmail[dot]com>

pkgname=quake3-cpma-maps
pkgver=20180207
pkgrel=1
pkgdesc="Challenge ProMode Arena (CPMA) Official Mappack (Can be used in any Quake 3 Mod)."
url="http://playmorepromode.org"
license=('custom')
arch=('any')
depends=('quake3')
conflicts=('quake3-cpma')
source=('https://cdn.playmorepromode.com/files/cpma-mappack-full.zip')
sha256sums=('5db933fc92c41f2e0941ab65725586d4d0c30fe84727427bb6b265e4d941a226')

package() {
	# Create Destination Directories
	install -d $pkgdir/opt/quake3/baseq3

	# CPMA Maps
	install -m 644 $srcdir/*.pk3 $pkgdir/opt/quake3/baseq3
}
