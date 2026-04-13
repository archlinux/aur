# Maintainer: Luke Labrie-Cleary <luke dot cleary at copenhagenatomics dot com>

pkgname=python-gmsh-bin
_pkgname=gmsh
pkgver=4.15.2
pkgrel=1
pkgdesc="Python package of the official Gmsh app and SDK"
arch=('x86_64')
url="https://pypi.org/project/gmsh/"
license=('GPL2')
depends=('python')
makedepends=('python-installer')
source=("https://files.pythonhosted.org/packages/py2.py3/g/gmsh/gmsh-${pkgver}-py2.py3-none-manylinux_2_24_x86_64.whl")
sha256sums=('4076a948ce22625330d1413d4982e22b5c69fc2f0f7951f5df64c778cf54108c')
noextract=("gmsh-${pkgver}-py2.py3-none-manylinux_2_24_x86_64.whl")

package() {
  cd "$srcdir"
  python -m installer --destdir="$pkgdir" "gmsh-${pkgver}-py2.py3-none-manylinux_2_24_x86_64.whl"
}