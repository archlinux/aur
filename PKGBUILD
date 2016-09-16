# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-executor
pkgver=14.0
pkgrel=1
pkgdesc="Programmer friendly subprocess wrapper"
url="https://github.com/xolox/python-executor"
license=('MIT')
depends=('python' 'python-coloredlogs' 'python-fasteners' 'python-humanfriendly' 'python-property-manager' 'python-six')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('3aa7545e3b5ce07cd2ddad3d44f9ae31')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
