# Maintainer: Beej Jorgensen <beej@beej.us>
pkgname=gprojector
pkgver=1.6.1
pkgrel=1
pkgdesc="Transforms an equirectangular map image into many global and regional map projections"
arch=('any')
url="http://www.giss.nasa.gov/tools/gprojector/"
license=('unknown')
depends=('java-runtime')
source=('http://www.giss.nasa.gov/tools/gprojector/GProjectorJ.tgz' 'gprojector')
install=${pkgname}.install
md5sums=('e3e0df69c044d45b5a38bcd2ed7fa05e'
         '9c9673e4522bbc3c2698f8f9002df6de')

package() {
	install -m 755 -d "$pkgdir/opt"
	cp -r $srcdir/G.ProjectorJ "$pkgdir/opt/gprojector"

	install -m 755 -d "$pkgdir/usr/bin"
	install -m 755 $srcdir/gprojector "$pkgdir/usr/bin/gprojector"
}
