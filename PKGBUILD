# Maintainer: Lucas H. Gabrielli <heitzmann@gmail.com>
repo=heitzmann
modname=gdspy
pkgname=python2-${modname}
pkgver=1.1.2
pkgrel=1
pkgdesc="Gdspy is a Python module for creating GDSII stream files, usually CAD layouts."
url="https://github.com/${repo}/${modname}"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python2' 'python2-numpy' 'python-future')
makedepends=('python2-setuptools')
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/${repo}/${modname}/archive/v${pkgver}.tar.gz")
md5sums=('16aee25eaf74726c0e899f48aad03ba0')

build() {
  cd "${srcdir}/${modname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${modname}-${pkgver}"
  python2 setup.py install --root=${pkgdir}
}

# vim:set ts=2 sw=2 et:
