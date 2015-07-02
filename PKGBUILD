# Maintainer: Erhan SAHIN <erhan@ssahin.net>

pkgname=python2-django-babel
pkgver=0.4.0
pkgrel=1
pkgdesc="Utilities for using Babel in Django"
arch=('any')
license=('BSD')
url="https://pypi.python.org/pypi/django_babel"
makedepends=('python2' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/d/django-babel/django-babel-$pkgver.tar.gz")
md5sums=('8832073a6b6fe98b72b99bfead0801db')

build() {
  cd "$srcdir/django-babel-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/django-babel-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1
#  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
