# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-humanfriendly
pkgver=2.3.2
pkgrel=1
pkgdesc="Human friendly input/output in Python"
url="https://github.com/xolox/python-humanfriendly"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('b84e0e569db706f6192e3df46f480087')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
