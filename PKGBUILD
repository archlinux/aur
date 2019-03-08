#Maintainer: Eli Patterson <elipup@gmail.com>
#Contributer: Franz Müller <ethylisocyanat@gmail.com>

pkgname=('python-osmnx')
_pyname=osmnx
pkgver=0.9
pkgrel=1
pkgdesc='Python framework for osm street network visualization'
url='https://github.com/gboeing/osmnx'
arch=('any')
license=('MIT')
depends=('python-requests>=2.21' 'python-numpy>=1.15' 'python-pandas>=0.23' 'python-geopandas>=0.4' 'python-networkx>=2.2' 'python-matplotlib>=2.2' 'python-shapely>=1.6' 'python-descartes>=1.1' 'python-geopy>=1.14' 'python-rtree>=0.8.3')
makedepends=('python-setuptools')
source=("https://github.com/gboeing/osmnx/archive/v$pkgver.tar.gz")
sha256sums=('0653e839e84f557ee6bff29e50e17e704aa7c35f800c7b58f8c84317205049dc')


package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}