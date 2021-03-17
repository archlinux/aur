# Maintainer: Doug Davis <ddavis at ddavis dot io>

pkgname=python-pygram11
pkgver=0.11.2
pkgrel=0
pkgdesc="histogramming in python accelerated with OpenMP"
arch=('x86_64')
url="https://github.com/douglasdavis/pygram11"
license=('MIT')
groups=()
depends=('python>=3.6' 'python-numpy')
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
sha256sums=('64e082ff958e2986f4fcd149b4d3b18544be7900b2c55cf173f07dc0743c380d')

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
