# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname='python-pydna'
pkgver=2.0.1
pkgrel=1
pkgdesc="Python3 classes for dsDNA simulation of homologous recombination, Gibson assembly and interactive cloning"
arch=('any')
url="https://github.com/BjornFJohansson/pydna"
license=('MIT')
depends=(
  'python'
  'python-appdirs>=1.3.0'
  'python-biopython>=1.65'
  'python-networkx>=1.8.1'
  'python-orderedset>=2.0'
  'python-prettytable>=0.7.2'
  'python-pyparsing>=2.1.10'
  'python-requests'
)
makedepends=('python-setuptools')
optdepends=(
    'python-matplotlib: gel simulation'
    'python-mpldatacursor: gel simulation'
    'python-numpy: gel simulation'
    'python-pint>=0.7.2: gel simulation'
    'python-scipy: gel simulation'
)
provides=('python-pydna')
conflicts=('python-pydna')
options=(!emptydirs)
source=("https://github.com/BjornFJohansson/pydna/archive/${pkgver}.tar.gz")
md5sums=('92a7fa5be11350dcf8d652d74f8c1762')

package() {
  cd "${srcdir}/pydna-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
