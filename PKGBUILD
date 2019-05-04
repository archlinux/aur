# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=python-dmenu
pkgver=0.2.1
pkgrel=1
pkgdesc="Python wrapper for dmenu"
url="https://github.com/allonhadaya/dmenu"
depends=('python' 'dmenu')
license=('MIT')
arch=('any')
source=('https://files.pythonhosted.org/packages/89/31/c6e5d18503fe3eb76bba0e1776461c605dbb580aceddc5765c1aa40a43aa/dmenu-0.2.1.tar.gz')
md5sums=('18ae50901ff372d0dbb4cb7fc3c43e0a')

build() {
    cd $srcdir/dmenu-0.2.1
    python setup.py build
}

package() {
    cd $srcdir/dmenu-0.2.1
    python setup.py install --root="$pkgdir" --optimize=1 
}
