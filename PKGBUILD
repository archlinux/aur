
pkgname=python-django-leaflet
_pkgname=django-leaflet
pkgver=0.27.0
_pkgver=0.27.0
pkgrel=1
pkgdesc="django-leaflet allows you to use Leaflet in your Django projects."
arch=(any)
url="https://pypi.python.org/pypi/django-leaflet"
license=('LGPL')
depends=('python' 'python-django')
makedepends=('python-distribute')
source=(https://github.com/makinacorpus/$_pkgname/archive/$_pkgver.tar.gz)
md5sums=('16b5b3453fb600c19a4742c26231b736')

build() {
  cd "$_pkgname-$_pkgver"
  python setup.py build
}

package() {
  cd "$_pkgname-$_pkgver"
  python setup.py install --root=$pkgdir
}
