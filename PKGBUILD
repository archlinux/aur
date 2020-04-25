
pkgname=python-django-geojson
_pkgname=django-geojson
pkgver=3.0.0
_pkgver=3.0.0
pkgrel=1
pkgdesc="django-geojson is a collection of helpers to (de)serialize (Geo)Django objects into GeoJSON."
arch=(any)
url="https://pypi.python.org/pypi/django-geojson"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-distribute')
source=(https://github.com/makinacorpus/$_pkgname/archive/$_pkgver.tar.gz)
md5sums=('70305521f352329479ec9a10e16e22f4')

package() {
  cd "$_pkgname-$_pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir 
}
