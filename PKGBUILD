# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.1.5
pkgrel=1
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/tkcalendar/archive/v$pkgver.tar.gz")
sha512sums=('861edc778b3d3aba0adfe3219667bc359afc2e825cf86ff4724ac6f1fd5069590a04a08378572765da2fc1dc8c7a248c2618ee68a36b5e72b76f04b9e1737674')

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

