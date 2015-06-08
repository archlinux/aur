pkgname=python2-orange
pkgver=2.7.2
pkgrel=1
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
depends=('python2-matplotlib' 'python2-scikit-learn' 'python2-pyqt4')
makedepends=('python2-setuptools')
optdepends=('python2-pyqt4: GUI support')
source=("http://orange.biolab.si/download/files/archive/Orange-${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
  cd "${srcdir}/Orange-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/Orange-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
}

