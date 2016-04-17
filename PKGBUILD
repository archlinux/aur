
pkgname=python-django-leaflet
_pkgname=django-leaflet
pkgver=0.18.1
_pkgver=0.18.1
pkgrel=1
pkgdesc="django-leaflet allows you to use Leaflet in your Django projects."
arch=(any)
url="https://pypi.python.org/pypi/django-leaflet"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-distribute')
source=(http://pypi.python.org/packages/source/d/django-leaflet/$_pkgname-$_pkgver.zip)
md5sums=('013cd5ff632ee1fc2bed6966c6f19ae7')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py install --root=$pkgdir
}
