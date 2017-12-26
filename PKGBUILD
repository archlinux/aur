# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pyvcf'
pkgver=0.6.8
pkgrel=1
pkgdesc="A Variant Call Format reader for Python."
arch=('any')
url="https://pypi.python.org/pypi/PyVCF"
license=('BSD')
depends=('python')
makedepends=('cython' 'python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/ca/d1/f1d394b0c2865d4c5d96856ffaa223b6013b3c1cbc74e0c2f2f4b34ea11f/PyVCF-0.6.8.linux-x86_64.tar.gz")
md5sums=('4eeb9700b03d4ab234c58227fb5f0331')

package() {
  cd "${srcdir}/PyVCF-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
