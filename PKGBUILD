# Maintainer: Carol Alexandru shapeshifter@archlinux.us
pkgname=python-imapclient
pkgver=0.12
pkgrel=1
pkgdesc="An easy-to-use, Pythonic and complete IMAP client library with no dependencies outside the Python standard library"
arch=('any')
url="http://imapclient.freshfoo.com/"
license=('BSD')
depends=('python')
makedepends=('python-distribute')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
source=("http://freshfoo.com/projects/IMAPClient/IMAPClient-$pkgver.tar.gz")
md5sums=('bb7dc4cb2b4ab82ebc73e0f01cb60e1d')

package() {
  cd "$srcdir/IMAPClient-$pkgver"
  python setup.py install --root=$pkgdir/ --optimize=1
}

