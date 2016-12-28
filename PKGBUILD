# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-executor
pkgver=15.0
pkgrel=1
pkgdesc="Programmer friendly subprocess wrapper"
url="https://github.com/xolox/python-executor"
license=('MIT')
depends=('python' 'python-coloredlogs' 'python-fasteners' 'python-humanfriendly' 'python-property-manager' 'python-six')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('d9562185402ba32935fc60199f86f9f4')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
