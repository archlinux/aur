# Maintainer: S.Leduc <sebastien@sleduc.fr>
pkgname=pyrepl
pkgver=0.8.4
pkgrel=1
pkgdesc="A Python library for building flexible command line interfaces"
url="http://pypi.python.org/pypi/pyrepl"
arch=("any")
license=('MIT')
depends=('python2')
source=("http://pypi.python.org/packages/source/p/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('9f02a9cc56162e2df647283d9180d7da')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
