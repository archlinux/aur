# Contributor: Slash <demodevil5[at]yahoo[dot]com>
# Maintainer: Lukas Sabota [prg318] <LTsmooth42[at]gmail[dot]com>

pkgname=quake3-cpma-maps
pkgver=20121121
pkgrel=2
pkgdesc="Challenge ProMode Arena (CPMA) Official Mappack (Can be used in any Quake 3 Mod)."
url="http://eu.promode.ru"
license=('custom')
arch=('any')
depends=('quake3' 'quake3-cpma')
source=('http://users.mrlazyinc.com/gaiia/cpma-mappack-full.zip')
DLAGENTS=('http::/usr/bin/wget') # server configured to disallow curl -- use wget instead
md5sums=('4f170d3a4c184897dbc34f48f2be810d')

package() {
	# Create Destination Directories
	install -d $pkgdir/opt/quake3/baseq3

	# CPMA Maps
	install -m 644 $srcdir/*.pk3 $pkgdir/opt/quake3/baseq3
}
