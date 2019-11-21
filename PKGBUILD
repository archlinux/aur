# Maintainer: Doug Davis <ddavis at ddavis dot io>

pkgname=python-pygram11
pkgver=0.6.1
pkgrel=1
pkgdesc="histogramming in python accelerated with OpenMP"
arch=('x86_64')
url="https://github.com/douglasdavis/pygram11"
license=('MIT')
groups=()
depends=('python>=3.5' 'python-numpy')
optdepends=()
checkdepends=()
makedepends=('gcc' 'python-setuptools' 'pybind11')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("https://pypi.io/packages/source/p/pygram11/pygram11-$pkgver.tar.gz")
sha256sums=('eea52496b4af3b6e0d65414031d2b5124ae598e4e97bcb64b46e5c1b67000e12')

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
