# Maintainer: M0Rf30

pkgname=python2-rudp
pkgver=1.0.1
pkgrel=1
pkgdesc="A rUDP library for Python"
arch=('any')
depends=('python2')
makedepends=('python2-setuptools')
url="https://github.com/hoffmabc/python-rudp"
license=('MIT')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/p/python-rudp/python-rudp-$pkgver.tar.gz)

build() {
  cd "$srcdir/python-rudp-$pkgver"

  msg 'Building...'
  python2 setup.py build
}

package() {
  cd "$srcdir/python-rudp-$pkgver"

  msg 'Installing...'
  python2 setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('eb01bde666681448575914003d0b0060')
