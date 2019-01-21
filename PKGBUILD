# Maintainer: Axilleas Pipinellis <axil archlinux gr>

_pkgname=objpool
pkgname=python2-$_pkgname
pkgver=0.4
pkgrel=1
pkgdesc="An object pooling library"
arch=('any')
url='https://github.com/grnet/objpool'
license=("BSD")
depends=('python2')
makedepends=(python2-distribute)
source=("https://pypi.python.org/packages/source/o/objpool/$_pkgname-$pkgver.tar.gz")

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
sha512sums=('b409d209e6707230513e947633f23a55f8ecc5789f0416dbb6b6c74459e8c51da687bad9f57fa91a1d109875c299770d329e28310f24e9be3b6a438ef7fd931a')
