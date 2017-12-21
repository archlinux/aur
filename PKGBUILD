# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pybwa'
pkgver=0.2.4
pkgrel=1
pkgdesc="Python libraries to interact with the BWA mapper."
arch=('any')
url="https://github.com/VDBWRAIR/pyBWA"
license=('BSD')
depends=('bash' 'bwa' 'python' 'python-biopython')
makedepends=('python-setuptools')
provides=('python-pybwa')
conflicts=('python-pybwa')
options=(!emptydirs)
source=("https://github.com/VDBWRAIR/pyBWA/archive/v${pkgver}.tar.gz")
md5sums=('0789be5883fa70c9c4a40ebf2d0d545d')

package() {
  cd "${srcdir}/pyBWA-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}
