# Maintainer: Julian Daube <joposter at gmail dot com>
# Maintainer: sasvari <sasvari@fastmail.com>
pkg="nazca"
pkgname="python-$pkg"
pkgver=0.5.12
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

md5sums=('b2ddeb411c76bc7cdff0c70f0dc40c4c')
sha256sums=('36eb212c2e52a0f9da42c6f449be81d40102a1584ae6ee278ef587a7a30b5621')
