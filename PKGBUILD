# Maintainer: Achilleas Pipinellis <axil archlinux gr>

pkgname=astakosclient
pkgver=0.19
pkgrel=1
pkgdesc="A client for the astakos authentication service"
arch=('any')
url='http://www.synnefo.org'
license=("BSD")
depends=('python2' 'python2-objpool' 'python2-simplejson')
makedepends=(python2-distribute)
source=("https://pypi.python.org/packages/source/a/$pkgname/$pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 README.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha512sums=('73bcb22c032f81c7903acff9edf7bc270e8f7c5c73745650d2ee5f6f15d735b94e1e52d8f5154298ede80bca625e91be6c8f2caac2365c575ceae5ba30f7d5a0')
sha512sums=('73bcb22c032f81c7903acff9edf7bc270e8f7c5c73745650d2ee5f6f15d735b94e1e52d8f5154298ede80bca625e91be6c8f2caac2365c575ceae5ba30f7d5a0')
