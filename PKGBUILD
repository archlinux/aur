# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
modname=gdspy
pkgname=python2-${modname}
pkgver=0.7
pkgrel=1
pkgdesc="Gdspy is a Python module for creating GDSII stream files, usually CAD layouts."
url="http://gdspy.sourceforge.net/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python2' 'python2-numpy')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://downloads.sourceforge.net/project/${modname}/${modname}/${modname}-${pkgver}/${modname}-${pkgver}.zip")
md5sums=('8f69f47a27476e0f099f241d6bb12143')

build() {
  cd "${srcdir}/${modname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${modname}-${pkgver}"
  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
