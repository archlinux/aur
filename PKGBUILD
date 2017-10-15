# Maintainer: Achilleas Pipinellis <axil@archlinux.gr>

pkgname=python2-progress
_pkgname=progress
pkgver=1.3
pkgrel=1
pkgdesc="Easy to use progress bars"
url="http://github.com/verigak/progress/"
arch=('any')
license=('MIT')
depends=('python2')
makedepends=('python2-distribute')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)

package() {

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
md5sums=('f65ccfcc2339d522b2dd5801aaa40dc7')
