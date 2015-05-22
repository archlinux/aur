# Contributor: Paul Nicholson <brenix@gmail.com>
# Contributor: Nathan Jones <nathanj@insightbb.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=twisted-web2
pkgver=8.1.0
pkgrel=4
pkgdesc="The twisted.web2 package in Twisted."
arch=('any')
url="http://twistedmatrix.com/"
license=('MIT')
depends=('twisted' 'python2')
conflicts=('twisted-web')
source=("http://twistedmatrix.com/Releases/Web2/8.1/TwistedWeb2-8.1.0.tar.bz2")
md5sums=('e34b48edf6fef075bd41ddbd215aed32')

package() {
  cd TwistedWeb2-8.1.0
  python2 setup.py install --prefix=/usr --root=$pkgdir
  install -D -m644 LICENSE \
    $pkgdir/usr/share/licenses/twisted-web2/LICENSE
}
