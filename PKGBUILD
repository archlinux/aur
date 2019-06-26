
pkgname=python-django-geojson
_pkgname=django-geojson
pkgver=2.12.0
_pkgver=2.12.0
pkgrel=1
pkgdesc="django-geojson is a collection of helpers to (de)serialize (Geo)Django objects into GeoJSON."
arch=(any)
url="https://pypi.python.org/pypi/django-geojson"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-distribute')
source=(https://github.com/makinacorpus/$_pkgname/archive/$_pkgver.tar.gz)
md5sums=('3a4f5204882c4570d358e856d19216cc')

package() {
  cd "$_pkgname-$_pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}
