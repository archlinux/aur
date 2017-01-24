#Maintainer: Franz Müller <ethylisocyanat@gmail.com>

pkgname=('python-osmnx')
_pyname=osmnx
pkgver=0.2.2
pkgrel=1
pkgdesc='Python framework for osm street network visualization'
url='https://github.com/gboeing/osmnx'
arch=('any')
license=('MIT')
depends=('python-requests>=2.11' 'python-numpy>=1.11' 'python-pandas>=0.19' 'python-geopandas>=0.2.1' 'python-networkx>=1.11' 'python-matplotlib>=1.5' 'python-shapely>=1.5' 'python-descartes>=1.0' 'python-geopy>=1.11' 'python-rtree>=0.8.3')
makedepends=('python-setuptools')
source=("https://github.com/gboeing/osmnx/archive/v$pkgver.tar.gz")
sha256sums=('3c4075c8493316659d79162bd5523f0216c9f186760897c2de07868f17a842db')


package() {
  cd "$srcdir/$_pyname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}