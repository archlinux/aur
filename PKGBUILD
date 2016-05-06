# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
repo=heitzmann
modname=gdspy
pkgname=python-${modname}
pkgver=0.8.1
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
source=("https://github.com/${repo}/${modname}/releases/download/v${pkgver}/${modname}-${pkgver}.tar.gz")
md5sums=('af56ce94889695a7ae07512e00574518')

build() {
  cd "${srcdir}/${modname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${modname}-${pkgver}"
  python setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
