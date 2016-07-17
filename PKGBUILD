# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
repo=heitzmann
modname=gdspy
pkgname=python-${modname}
pkgver=0.9
pkgrel=1
pkgdesc="Gdspy is a Python module for creating GDSII stream files, usually CAD layouts."
url="https://github.com/${repo}/${modname}"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python' 'python-numpy')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/${repo}/${modname}/releases/download/v${pkgver}/${modname}-${pkgver}.zip")
md5sums=('e91a58e6834a5a0ad68e49ad4d1fda0d')

build() {
  cd "${srcdir}/${modname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${modname}-${pkgver}"
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
