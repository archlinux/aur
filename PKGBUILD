# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>

pkgname=python2-progress
_pkgname=progress
pkgver=1.2
pkgrel=1
pkgdesc="Easy to use progress bars"
url="http://docs.dev.grnet.gr/pypi/"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=(http://pypi.python.org/packages/source/p/$_pkgname/$_pkgname-$pkgver.tar.gz)

package() {

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('c1dbf49a41e80408d3874d976ba894cc')
