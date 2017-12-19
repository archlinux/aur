# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-logzero'
pkgver=1.3.1
pkgrel=1
pkgdesc="Robust and effective logging for Python 2 and 3"
arch=('any')
url="https://github.com/metachris/logzero"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('python-logzero')
conflicts=('python-logzero')
options=(!emptydirs)
source=("https://github.com/metachris/logzero/archive/v${pkgver}.tar.gz")
md5sums=('4e7082453b9d5844d6132a3760126647')

package() {
  cd "${srcdir}/logzero-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
