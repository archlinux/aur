# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
repo=heitzmann
modname=gdspy
pkgname=python2-${modname}
pkgver=0.8.1
pkgrel=2
pkgdesc="Gdspy is a Python module for creating GDSII stream files, usually CAD layouts."
url="https://github.com/${repo}/${modname}"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python2' 'python2-numpy')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/${repo}/${modname}/releases/download/v${pkgver}/${modname}-${pkgver}.tar.gz")
md5sums=('023e1f0790cd1fd02e78d0c3e2a2e695')

build() {
  cd "${srcdir}/${modname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${modname}-${pkgver}"
  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
