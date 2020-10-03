# Contributor: Alexandr Parkhomenko <it@52tour.ru>

pkgname=python-orange-widget-base
pkgver=4.8.1
pkgrel=1
pkgdesc="Base widget and workflow definitions for Orange."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
makedepends=('python-setuptools')
depends=('python-chardet' 'python-docutils' 'python-pyqtgraph' 'python-xlrd' 'python-matplotlib' 'python-scikit-learn' 'python-psycopg2' 'python-joblib' 'python-keyrings-alt' 'python-bottleneck' 'python-anyqt' 'qt5-svg' 'python-pip' 'python-serverfiles' 'python-louvain' 'python-xlsxwriter' 'python-opentsne' 'python-networkx' 'python-requests' 'python-pandas')
source=("https://github.com/biolab/orange-widget-base/archive/${pkgver}.tar.gz")
sha256sums=('af82f0da0102c7a3e973c405ac89ae91cb470bb4cc94a590a2b2c8bc276d441f')

build() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/orange-widget-base-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
}

