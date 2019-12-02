# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-verboselogs
pkgver=1.7
pkgrel=3
pkgdesc="Verbose logging level for Python's logging module"
url="https://github.com/xolox/python-verboselogs"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('105744f2c5b43200f2211d526a691289')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
