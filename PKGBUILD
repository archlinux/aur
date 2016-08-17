# Maintainer: Carol Alexandru shapeshifter@archlinux.us
pkgname=python-imapclient
pkgver=1.0.1
pkgrel=1
pkgdesc="An easy-to-use, Pythonic and complete IMAP client library with no dependencies outside the Python standard library"
arch=('any')
url="http://imapclient.freshfoo.com/"
license=('BSD')
depends=('python' 'python-backports.ssl')
makedepends=('python-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("http://freshfoo.com/projects/IMAPClient/IMAPClient-$pkgver.tar.gz")
md5sums=('ff508fbed5745725362a2b292e4503a1')

package() {
  cd "$srcdir/IMAPClient-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

