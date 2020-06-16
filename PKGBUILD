# Maintainer: Doug Davis <ddavis at ddavis dot io>

pkgname=python-pygram11
pkgver=0.9.1
pkgrel=1
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
sha256sums=('5475366eb773dd76dac929b0d8e0fe9614165e737aca2ef61a744d737b4acca3')

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
