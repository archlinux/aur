# Maintainer: Paulo Castro <p.oliveira.castro@gmail.com>
pkgname=python-geopandas
pkgver=0.1.1
pkgrel=1
pkgdesc="Geographic pandas extension"
arch=('any')
url="https://github.com/geopandas/geopandas"
license=('BSD')
depends=('python' 'python-numpy' 'python-pandas' 'python-shapely' 'python-fiona' 'python-six' 'python-pyproj')
optdepends=('python-geopy' 'python-psycopg2')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/g/geopandas/geopandas-0.1.1.tar.gz")
md5sums=('a01b5d3eb6bc097665a0ba297c39029f')

package() {
  cd "$srcdir/geopandas-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
