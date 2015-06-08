# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: drakkan <[email protected]>

pkgname=python2-setproctitle
pkgver=1.1.8
pkgrel=1
pkgdesc="allows a python process to change its process title"
arch=('i686' 'x86_64')
url="http://code.google.com/p/py-setproctitle/"
license=('BSD')
depends=('python2')
source=(http://pypi.python.org/packages/source/s/setproctitle/setproctitle-${pkgver}.tar.gz)
options=(!emptydirs)
md5sums=('728f4c8c6031bbe56083a48594027edd')

build() {
  cd ${srcdir}/setproctitle-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/setproctitle-${pkgver}
  python2 setup.py install --root=${pkgdir} --optimize=1
}

# vim:set ts=2 sw=2 et:
