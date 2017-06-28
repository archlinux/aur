
pkgname=python-django-geojson
_pkgname=django-geojson
pkgver=2.10.0
_pkgver=2.10.0
pkgrel=1
pkgdesc="django-geojson is a collection of helpers to (de)serialize (Geo)Django objects into GeoJSON."
arch=(any)
url="https://pypi.python.org/pypi/django-geojson"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-distribute')
source=(https://github.com/makinacorpus/$_pkgname/archive/$_pkgver.tar.gz)
md5sums=('5ba3efaa496bcff452f4ac68b107e67c')

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}
