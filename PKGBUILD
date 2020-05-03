# Maintainer: Julian Daube <joposter at gmail dot com>
# Maintainer: sasvari <sasvari@fastmail.com>
pkg="nazca"
pkgname="python-$pkg"
pkgver=0.5.10
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

md5sums=('e75c1fd1d27cccd7419d242d5670c11b')
sha256sums=('81bba18a1fc8d495af137b79f9726bcdb6349a95fa9c58f6878a8459e3bb4c7e')
