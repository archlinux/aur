# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.1.1
pkgrel=1
pkgdesc="Calendar and DateEntry widgets for Tkinter"
arch=('any')
url="https://github.com/j4321/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/tkcalendar/archive/v$pkgver.tar.gz")
sha512sums=('27aa732554c5fc2765b97d439712c50e1fb21ab6445d2fc574805870247c53a03c5991cfb255bb7bb478a7cb6f982a262ccb2c4e7d0942e8c7d906d0a7c678d2')

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

