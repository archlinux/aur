# Maintainer: Lev Levitsky <levlev at mail.ru>

pkgname=python-pynumpress
_bname=pynumpress
pkgver=0.0.6
pkgrel=1
pkgdesc="A more pythonic wrapper around the MSNumpress library for mass spectrometry numerical data compression"
arch=('x86_64')
url="https://github.com/mobiusklein/pynumpress"
license=('Apache')
depends=('python-numpy')
makedepends=('cython')
options=(!emptydirs)
source=("https://pypi.io/packages/source/p/${_bname}/${_bname}-${pkgver}.tar.gz")
sha256sums=('a5d4633ad48cb5657b38c518abe320094bcf1465190732919622e1ab9a906f56')

package() {
  cd "$srcdir/${_bname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
