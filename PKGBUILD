# Maintainer: Iru Cai <mytbk920423@gmail.com>
pkgname=python2-whitenoise
pkgver=2.0.2
pkgrel=1
pkgdesc="Radically simplified static file serving for WSGI applications"
arch=('any')
url="https://pypi.python.org/pypi/whitenoise"
license=('MIT')
depends=('python2')
source=("https://pypi.python.org/packages/source/w/whitenoise/whitenoise-$pkgver.tar.gz")
md5sums=('1de83f28df3e1db8b154be685a286605')

build() {
  cd "$srcdir/whitenoise-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/whitenoise-$pkgver"

  python2 setup.py install --root=$pkgdir --optimize=1
}

# vim:set ts=2 sw=2 et:
