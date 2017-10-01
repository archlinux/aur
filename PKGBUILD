# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.1.2
pkgrel=1
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/tkcalendar/archive/v$pkgver.tar.gz")
sha512sums=('502771e3800f86ac1260d7e64650f3f57df9d9abbbd40a45add9e1f3cfad2035dfe0a991efc01bb70e619ca2e845177d2636a07de9e53cc183d9f0a6d7b229af')

package_python-tkcalendar() {
  makedepends=('python-setuptools')
  depends=('python' 'tk')
  cd "${srcdir}/tkcalendar-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-tkcalendar() {
  makedepends=('python2-setuptools')
  depends=('python2' 'tk')
  cd "${srcdir}/tkcalendar-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

