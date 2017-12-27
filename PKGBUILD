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
source=("https://pypi.python.org/packages/20/b6/36bfb1760f6983788d916096193fc14c83cce512c7787c93380e09458c09/PyVCF-0.6.8.tar.gz")
md5sums=('3cc70aa59e62dab7b4a85bd5a9f2e714')

package() {
  cd "${srcdir}/PyVCF-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
