
pkgname=python-django-leaflet
_pkgname=django-leaflet
pkgver=0.16.0
_pkgver=0.16.0
pkgrel=1
pkgdesc="django-leaflet allows you to use Leaflet in your Django projects."
arch=(any)
url="https://pypi.python.org/pypi/django-leaflet"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/d/django-leaflet/$_pkgname-$_pkgver.zip)
md5sums=('7b26d56e6969e16d11e5439158283ef0')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py install --root=$pkgdir
}
