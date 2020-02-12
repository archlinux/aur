# Maintainer: Doug Davis <ddavis at ddavis dot io>

pkgname=python-pygram11
pkgver=0.7.3
pkgrel=1
pkgdesc="histogramming in python accelerated with OpenMP"
arch=('x86_64')
url="https://github.com/douglasdavis/pygram11"
license=('MIT')
groups=()
depends=('python>=3.5' 'python-numpy')
optdepends=()
checkdepends=()
makedepends=('gcc' 'python-setuptools' 'pybind11' 'python-numpy')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.io/packages/source/p/pygram11/pygram11-$pkgver.tar.gz")
sha256sums=('72ac1a62461c6bcba08e8b7ec81098ca266c5d44c84e3fe61ce07d52fe95e1d8')

build() {
  cd "${srcdir}/pygram11-${pkgver}"
  echo "nothing"
}

check() {
  cd "${srcdir}/pygram11-${pkgver}"
  echo "nothing"
}

package() {
  cd "${srcdir}/pygram11-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
