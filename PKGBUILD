# Maintainer: Doug Davis <ddavis at ddavis dot io>

pkgname=python-pygram11
pkgver=0.8.0
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
sha256sums=('d14a5b792ff17b6f6dea66d045d3033c670d77f81754a17f22f5b0899da77464')

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
