# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-datacache'
pkgver=0.4.20
pkgrel=1
pkgdesc="Python helpers for transparently downloading datasets"
arch=('any')
url="https://pypi.python.org/pypi/datacache"
license=('Apache-2.0')
depends=(
  'python'
  'python-appdirs>=1.4.0'
  'python-biopython>=1.65'
  'python-pandas>=0.15.2'
  'python-progressbar33>=2.4'
  'python-requests>=2.5.1'
  'python-typechecks>=0.0.2'
  'python-mock')
optdepends=()
makedepends=('python-setuptools')
ptions=(!emptydirs)
source=("https://pypi.python.org/packages/b6/d9/81d3eb73746ee94e4acd054bae9466f94c4edeb1d3f4357dc6a1d066db6e/datacache-${pkgver}.tar.gz")
md5sums=('448c7339654a0132c99b2d6656a812f3')

package() {
  cd "${srcdir}/datacache-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
