# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-executor
pkgver=18.0
pkgrel=1
pkgdesc="Programmer friendly subprocess wrapper"
url="https://github.com/xolox/python-executor"
license=('MIT')
depends=('python' 'python-coloredlogs' 'python-fasteners' 'python-humanfriendly' 'python-property-manager' 'python-six')
makedepends=('python-setuptools')
source=("https://github.com/xolox/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('8419bfaa23f7bb5e634221d47f9ae1c4')
arch=('any')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
