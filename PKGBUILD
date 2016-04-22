# Maintainer: Vladimir Tsanev <tsachev@gmail.com>
# Contributor: Ankur Srivastava <ankurs47@gmail.com>
pkgname=python2-mercurial_keyring
pkgver=1.1.2
pkgrel=2
pkgdesc="Mercurial Keyring Extension"
arch=('any')
url="http://pypi.python.org/pypi/mercurial_keyring"
makedepends=('python2-distribute')
depends=('python2-mercurial_extension_utils' 'python-keyrings-alt' 'python2')
license=('BSD')
source=(http://pypi.python.org/packages/source/m/mercurial_keyring/mercurial_keyring-$pkgver.tar.gz)
md5sums=('93e365518312184640d9dea3a700cadc')

package() {
  cd $srcdir/mercurial_keyring-$pkgver
  python2 setup.py install --root=$pkgdir || return 1

  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
