# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-sample-sheet'
pkgver=0.1.1
pkgrel=1
pkgdesc="A bioinformatics Illumina Sample Sheet parsing utility"
arch=('any')
url="https://pypi.python.org/pypi/sample_sheet"
license=('MIT')
depends=(
  'python'
  'python-click'
  'python-smart-open'
  'python-tabulate'
  'python-terminaltables'
)
makedepends=('python-setuptools')
optdepends=()
provides=('python-sample-sheet')
conflicts=('python-sample-sheet')
options=(!emptydirs)
source=("https://pypi.python.org/packages/fd/98/fc423199c66c513773a1394828a5e3b599bc4492f79fae087e92f01eb1d5/sample_sheet-0.1.1.tar.gz")
md5sums=('daf3355933d0763223b4e99c2a7bc24d')

package() {
  cd "${srcdir}/sample_sheet-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
