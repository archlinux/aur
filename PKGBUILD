# Maintainer: Julian Daube <joposter at gmail dot com>
# Maintainer: sasvari <sasvari@fastmail.com>
pkg="nazca"
pkgname="python-$pkg"
pkgver=0.5.11
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

md5sums=('b95a924115c7b97d0e51239fb5b15f7d')
sha256sums=('454f5bb9b3519e6b8657c64df7508cf6a5d0df03385a49cdff01e187d3eedd94')
