# Maintainer: 

pkgname=python2-fedmsg
pkgver=0.15.0
pkgrel=1
pkgdesc='Utilities used around Fedora Infrastructure to send and receive messages'
arch=(any)
url='https://fedmsg.readthedocs.org/'
license=(LGPLv2)
depends=(python2)
source=(http://pypi.python.org/packages/source/f/fedmsg/fedmsg-$pkgver.tar.gz)
md5sums=('248b6139c9480be9fef0d153ef35d106')

package() {
  cd fedmsg-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
