# Maintainer: Julian Daube <joposter at gmail dot com>
# Maintainer: sasvari <sasvari@fastmail.com>
pkg="nazca"
pkgname="python-$pkg"
pkgver=0.5.13
pkgrel=1
pkgdesc="Nazca module for photonic integrated circuit design."
arch=(any)
url="https://nazca-design.org/"
license=("AGPLv3+")
depends=("python" 
	"python-yaml"
	"python-scipy"
	"python-pandas" 
	"python-matplotlib" 
	"python-pillow" 
	"python-svgwrite"
	"ipython")
source=("https://nazca-design.org/dist/$pkg-$pkgver.zip")

package() {
	cd "$srcdir/$pkg-$pkgver"
	python setup.py install --optimize=1 --root="$pkgdir/" --prefix="/usr"
}

md5sums=('ebf2fc5202671e570061271afc1866ee')
sha256sums=('013e287395efa9b269339b07cbfcaa5f3aa1ee1495e4a678c164cb734bd0b679')
