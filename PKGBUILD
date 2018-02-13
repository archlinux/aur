
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

pkgname=python-rstr
pkgver=2.2.6
pkgrel=1
pkgdesc="Generate random strings in Python"
arch=('any')
depends=('python')
makedepends=('python-setuptools')
url="https://bitbucket.org/leapfrogdevelopment/rstr"
license=('BSD')
source=(https://pypi.python.org/packages/be/52/f87d6a9c691329dc71eaa6263f63cc262bd818df89e2dc981720db9dc9c5/rstr-${pkgver}.tar.gz)

build() {
  cd "${pkgname#python-}-$pkgver"
  python setup.py build
}

package() {
  cd "${pkgname#python-}-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
md5sums=('be2d1a655e3adb5d55db981846fe9761')
