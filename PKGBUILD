# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-fastcluster'
pkgver=1.1.24
pkgrel=1
pkgdesc="Fast hierarchical clustering routines for R and Python."
arch=('any')
url="https://pypi.python.org/pypi/fastcluster"
license=('BSD')
depends=('python' 'python-numpy>=1.9.2')
makedepends=('python-setuptools')
provides=('python-fastcluster')
conflicts=('python-fastcluster')
options=(!emptydirs)
source=("https://pypi.python.org/packages/1e/00/9910dd324f32582051d0ee6922c3cd4727234aae96366f3867c46a70cd78/fastcluster-${pkgver}.tar.gz")
md5sums=('e71235732f43f5f19d71cfaf3b45ff0c')

package() {
  cd "${srcdir}/fastcluster-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
