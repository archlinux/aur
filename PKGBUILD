pkgname=('python-django-rest-framework-camel-case' 'python2-django-rest-framework-camel-case')
pkgver=0.2.0
pkgrel=1
pkgdesc="Camel case JSON support for Django REST framework."
arch=(any)
url="https://github.com/vbabiy/djangorestframework-camel-case"
license=('BSD')
source=("https://pypi.python.org/packages/06/e0/e7b0d8371d20b8d0b6ef7490951b8bb9a392fdf250c35d596ae6842a3db4/djangorestframework-camel-case-0.2.0.tar.gz")
sha256sums=('989c5c2d0324069fc1ecea4a5cb8913749d5f2f3c507b38977913ff1b76a719e')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-django-rest-framework-camel-case() {
  cd "$srcdir/djangorestframework-camel-case-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-rest-framework-camel-case() {
  cd "$srcdir/djangorestframework-camel-case-$pkgver"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
