# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.2.1
pkgrel=1
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/tkcalendar/archive/v$pkgver.tar.gz")
sha512sums=('07eaf907c84aeace56dca809dcd07aa590d324ddaeee792ce2b7b768ede5233c0f7642af1d6fd39fc3fa76ab4b7c026fbe3d1025a5f92ef4903234487a09e602')

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

