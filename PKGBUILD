# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-django-browserid' 'python2-django-browserid')
pkgver=2.0.0
pkgrel=1
pkgdesc="A library that integrates BrowserID authentication into Django"
arch=(any)
url="https://github.com/mozilla/django-browserid"
license=('MPL')
options=(!emptydirs)
source=("https://github.com/mozilla/django-browserid/archive/v${pkgver}.tar.gz")
sha256sums=('768c71e94bed9936ebe67247ee0b3cd0c70fe71b0c4be9856834717894d94c7b')
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
