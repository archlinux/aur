# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-humanfriendly
pkgver=2.0.1
pkgrel=1
pkgdesc="Human friendly input/output in Python"
url="https://github.com/xolox/python-humanfriendly"
license=('MIT')
depends=('python')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('586d2e27f8bcb071f018a7d9ce2496ce')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
