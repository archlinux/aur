# Maintainer: Andrejs Mivreņiks <gim at fastmail dot fm>
pkgname=python-irclib
pkgver=0.4.8
pkgrel=2
pkgdesc='Internet Relay Chat (IRC) protocol client library'
arch=('any')
url='https://pypi.python.org/pypi/python-irclib/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
changelog='ChangeLog'
source=("http://sourceforge.net/projects/python-irclib/files/python-irclib/${pkgver}/python-irclib-${pkgver}.tar.gz")
sha256sums=('81ee3a6401d4f4d1af1975913438a32fa453b4220bd2e509b7b5af4cbc29a4f4')

package() {
  cd "$srcdir/python-irclib-$pkgver"
  python setup.py install --root=$pkgdir --optimize=1
}
