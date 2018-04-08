# Maintainer: Juliette Monsel <j_4321 at protonmail dot com>
pkgname=('python-tkcalendar' 'python2-tkcalendar')
pkgver=1.2.0
pkgrel=1
pkgdesc="Calendar widget for Tkinter"
arch=('any')
url="https://pypi.python.org/pypi/tkcalendar"
license=('GPL3')
source=("tkcalendar-$pkgver.tar.gz::https://github.com/j4321/tkcalendar/archive/v$pkgver.tar.gz")
sha512sums=('bf3cf951ae3d706b2372b3fdd0bd7a1a0b884095bb468ca79b308b2beea91601b650703a0c2864120994bb3ffea269fe929744d0a9ff0201812cf4188a3b9e85')

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

