# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-nine
pkgver=1.0.0
pkgrel=2
pkgdesc="Python 2 and 3 compatibility library, such that your code looks more like Python 3"
url="https://github.com/nandoflorestan/nine/"
license=('Public Domain')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/nandoflorestan/nine/archive/v${pkgver}.tar.gz")
md5sums=('bdefe688387d050cc550eadce2ff45c3')
arch=('any')

package() {
  cd "$srcdir/nine-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE.rst ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
