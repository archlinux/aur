# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-property-manager
pkgver=2.3.1
pkgrel=2
pkgdesc="Useful property variants for Python programming"
url="https://github.com/xolox/python-property-manager"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-humanfriendly' 'python-verboselogs')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('526483dc5176f211184045b7520f42dc')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
