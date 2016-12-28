# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=npm-accel
pkgver=0.4
pkgrel=1
pkgdesc="Accelerator for npm, the Node.js package manager"
url="https://github.com/xolox/python-npm-accel"
license=('MIT')
depends=('python' 'python-chardet' 'python-executor' 'python-humanfriendly' 'python-property-manager' 'python-verboselogs')
source=("https://github.com/xolox/python-${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('6b0dbc6721a4e46eea553ed937432d1f')
arch=('any')

package() {
  cd "$srcdir/python-$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
