pkgname=python-orange
pkgver=3.1
pkgrel=1
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-matplotlib' 'python-scikit-learn' 'python-pyqt4')
optdepends=('python-pyqt4: GUI support')
source=("https://github.com/biolab/orange3/archive/${pkgver}.tar.gz")
md5sums=('bb6011d0db23f3ba2720431342614a65')

build() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py build
}

packag() {
  cd "${srcdir}/orange3-$pkgver"
  python setup.py install --root="${pkgdir}"
}
