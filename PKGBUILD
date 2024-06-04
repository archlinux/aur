pkgname=python-casadi-bin
pkgver=3.6.5
pkgrel=1
pkgdesc="Symbolic framework for automatic differentiation and numeric optimization, prebuilt"
arch=('x86_64')
url="https://github.com/casadi/casadi"
conflicts=(casadi)
provides=(casadi)
license=('GPL3')
depends=(
python
lapack
tinyxml
tinyxml2
swig
ipython
python-numpy
python-scipy
python-matplotlib
)
makedepends=(
python-installer
)
noextract=("casadi-${pkgver}-cp312-none-manylinux2014_x86_64.whl")
source=("https://github.com/casadi/casadi/releases/download/${pkgver}/casadi-${pkgver}-cp312-none-manylinux2014_x86_64.whl")
sha256sums=('0118637823e292a9270133e02c9c6d3f3c7f75e8c91a6f6dc5275ade82dd1d9d')

package() {
  python -m installer --destdir="${pkgdir}" "casadi-${pkgver}-cp312-none-manylinux2014_x86_64.whl"
}
