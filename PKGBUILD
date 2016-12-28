# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-humanfriendly
pkgver=2.2
pkgrel=1
pkgdesc="Human friendly input/output in Python"
url="https://github.com/xolox/python-humanfriendly"
license=('MIT')
depends=('python')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('4ce06879cd8fba39980ca20d6e6256cb')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
