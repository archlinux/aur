
pkgname=python-django-leaflet
_pkgname=django-leaflet
pkgver=0.19.0
_pkgver=0.19.0
pkgrel=1
pkgdesc="django-leaflet allows you to use Leaflet in your Django projects."
arch=(any)
url="https://pypi.python.org/pypi/django-leaflet"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-distribute')
source=(https://github.com/makinacorpus/$_pkgname/archive/$_pkgver.tar.gz)
md5sums=('d55bde9d65e0ff907547ee9552cc4cd8')

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$_pkgver"
  python setup.py install --root=$pkgdir
}
