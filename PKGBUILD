# Maintainer: Dario Pellegrini <pellegrini.dario at gmail dot com>
pkgname=python-imapclient
pkgver=2.2.0
pkgrel=1
pkgdesc="An easy-to-use, Pythonic and complete IMAP client library with no dependencies outside the Python standard library"
arch=('any')
url="https://github.com/mjs/imapclient/"
license=('BSD')
depends=('python' 'python-backports.ssl')
makedepends=('python-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("https://github.com/mjs/imapclient/archive/$pkgver.tar.gz")
md5sums=('c90f93ce0b3a7dfe26409141b66295fc')

package() {
  cd "$srcdir/imapclient-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

