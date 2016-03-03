# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-django-browserid' 'python2-django-browserid')
pkgver=2.0.1
pkgrel=1
pkgdesc="A library that integrates BrowserID authentication into Django"
arch=(any)
url="https://github.com/mozilla/django-browserid"
license=('MPL')
options=(!emptydirs)
source=("https://github.com/mozilla/django-browserid/archive/v${pkgver}.tar.gz")
sha256sums=('28f3937309b2f0a35fd7360bb7511de4705d67216a00142e2f47940a0c7a8b9f')
makedepends=('python-setuptools' 'python2-setuptools')

package_python-django-browserid() {
  depends=('python-django' 'python-requests')
  cd "$srcdir/django-browserid-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-browserid() {
  depends=('python2-django' 'python2-requests')
  cd "$srcdir/django-browserid-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
