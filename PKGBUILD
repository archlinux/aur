# Maintainer: 

pkgname=python2-fedmsg
pkgver=0.17.0
pkgrel=1
pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages'
arch=(any)
url='https://fedmsg.readthedocs.org/'
license=(LGPLv2)
depends=(python2)
source=(http://pypi.python.org/packages/source/f/fedmsg/fedmsg-$pkgver.tar.gz)
md5sums=('a56ffea38fd83d1f1c2592363e6f764b')

package() {
  cd fedmsg-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
