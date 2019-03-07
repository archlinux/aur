# Maintainer: Dario Pellegrini <pellegrini.dario at gmail dot com>
pkgname=python-imapclient
pkgver=2.1.0
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
md5sums=('29a0d5170331a615e6f2a92fba3391b1')

package() {
  cd "$srcdir/imapclient-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

