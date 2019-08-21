# Maintainer: Maikel Wever <maikelwever@gmail.com>
pkgname=python-pyrr
pkgver=0.10.3
pkgrel=1
pkgdesc="Provides 3D mathematical functions using the power of NumPy."
url="https://github.com/adamlwgriffiths/Pyrr"
license=('BSD')
depends=('python' 'python-numpy' 'python-multipledispatch')
makedepends=('python-setuptools')
source=("https://github.com/adamlwgriffiths/Pyrr/archive/${pkgver}.tar.gz")
md5sums=('3e2c2ff64fdfc1f38980a7afe72128ad')
arch=('any')

package() {
  cd "$srcdir/Pyrr-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}

# vim:set ts=2 sw=2 et:
