# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Maikel Wever <maikelwever@gmail.com>

pkgname=npm-accel
pkgver=2.0
pkgrel=1
pkgdesc="Accelerator for npm, the Node.js package manager"
url="https://github.com/xolox/python-npm-accel"
license=('MIT')
depends=('python' 'python-chardet' 'python-executor' 'python-humanfriendly' 'python-property-manager' 'python-verboselogs')
source=("https://github.com/xolox/python-${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('cde375d40a46321c20072a3b7ef29053')
arch=('any')

package() {
  cd "$srcdir/python-$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
