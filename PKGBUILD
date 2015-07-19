# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
modname=gdspy
pkgname=python-${modname}
pkgver=0.7.1
pkgrel=1
pkgdesc="Gdspy is a Python module for creating GDSII stream files, usually CAD layouts."
url="https://github.com/heitzmann/gdspy"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python' 'python-numpy')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/heitzmann/${modname}/archive/v${pkgver}.tar.gz")
md5sums=('5a6bbc5a64c05f8f18b666140778b47d')

build() {
  cd "${srcdir}/${modname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${modname}-${pkgver}"
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
