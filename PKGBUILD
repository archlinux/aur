# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pyvcf'
pkgver=0.6.0
pkgrel=1
pkgdesc="A Variant Call Format reader for Python."
arch=('any')
url="https://github.com/jamescasbon/PyVCF"
license=('BSD')
depends=('python')
makedepends=('cython' 'python-setuptools')
provides=('python-pyvcf')
conflicts=('python-pyvcf')
options=(!emptydirs)
source=("https://github.com/jamescasbon/PyVCF/archive/v${pkgver}.tar.gz")
md5sums=('5e38a610b1bf837e5e74a748e281cec7')

package() {
  cd "${srcdir}/PyVCF-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
