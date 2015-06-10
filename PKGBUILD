# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>

_pkgname=objpool
pkgname=python2-$_pkgname
pkgver=0.3
pkgrel=1
pkgdesc="An object pooling library"
arch=('any')
url=('https://github.com/grnet/objpool')
license=("BSD")
depends=('python2')
makedepends=(python2-distribute)
source=("http://pypi.python.org/packages/source/o/objpool/$_pkgname-$pkgver.tar.gz")

package() {

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}
md5sums=('a80eb465b4e4a05c43a1023e946ca441')
