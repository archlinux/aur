# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgname=('python-django-browserid' 'python2-django-browserid')
pkgver=1.0.0
pkgrel=1
pkgdesc="A library that integrates BrowserID authentication into Django"
arch=(any)
url="https://github.com/mozilla/django-browserid"
license=('MPL')
options=(!emptydirs)
source=("https://github.com/mozilla/django-browserid/archive/v${pkgver}.tar.gz")
sha256sums=('2c83c1ba86987ec2986a02eda50941ddae7bbb92217e33bb9ed8ba5c94da527e')
makedepends=('python-setuptools' 'python2-setuptools')

prepare() {
  cp -a django-browserid-$pkgver{,-py2}
}

build() {
  cd "$srcdir/django-browserid-$pkgver"

  cd "$srcdir/django-browserid-$pkgver"
}

check() {
  cd "$srcdir/django-browserid-$pkgver"

  cd "$srcdir/django-browserid-$pkgver"
}

package_python-django-browserid() {
  depends=('python-django')
  cd "$srcdir/django-browserid-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-django-browserid() {
  depends=('python2-django')
  cd "$srcdir/django-browserid-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
