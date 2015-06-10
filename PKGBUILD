# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>

pkgname=astakosclient
pkgver=0.15
pkgrel=1
pkgdesc="A client for the astakos authentication service"
arch=('any')
url=('http://www.synnefo.org')
license=("BSD")
depends=('python2' 'python2-objpool' 'python2-simplejson')
makedepends=(python2-distribute)
source=("http://pypi.python.org/packages/source/a/$pkgname/$pkgname-$pkgver.tar.gz")

package() {

  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
#  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
md5sums=('1b51c3b9b7b2a693d21eee681000b948')
