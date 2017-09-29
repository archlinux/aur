# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=npm-accel
pkgver=1.0
pkgrel=2
pkgdesc="Accelerator for npm, the Node.js package manager"
url="https://github.com/xolox/python-npm-accel"
license=('MIT')
depends=('python' 'python-chardet' 'python-executor' 'python-humanfriendly' 'python-property-manager' 'python-verboselogs')
source=("https://github.com/xolox/python-${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3917fc0806dbd5796a020ac1f43c2f3c')
arch=('any')

package() {
  cd "$srcdir/python-$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
