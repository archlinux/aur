# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-spectra'
pkgver=0.0.10
pkgrel=1
pkgdesc="Color scales and color conversion in Python"
arch=('any')
url="https://github.com/jsvine/spectra"
license=('MIT')
depends=('python' 'python-networkx' 'python-colormath')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${pkgname}"-"${pkgver}".tar.gz::https://pypi.python.org/packages/09/fb/03db11656c75b19fb18e682dde67eee1096ba09da2bd100ce4b388003006/spectra-0.0.10.tar.gz)
md5sums=('fb6cf429abe888298520be9f3fb2fdef')

package() {
  cd "${srcdir}"/"${pkgname//python-/}"-"${pkgver}"
  python setup.py install --root="${pkgdir}"/ --optimize=1
}
