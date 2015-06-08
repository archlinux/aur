pkgname=("python2-eventlet" "python-eventlet")
pkgver=0.17.4
pkgrel=1
pkgdesc="Highly concurrent networking library"
arch=(any)
url="http://eventlet.net"
license=(MIT)
source=("http://pypi.python.org/packages/source/e/eventlet/eventlet-${pkgver}.tar.gz")

package_python2-eventlet() {
  depends=("python2-greenlet" "python2-setuptools")
  makedepends=("python2")
  cd "${srcdir}/eventlet-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}"
}

package_python-eventlet() {
  depends=("python-greenlet" "python-setuptools")
  makedepends=("python")
  cd "${srcdir}/eventlet-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}"
}
md5sums=('fea0993b14cc7322f944bdd535c4f24a')
