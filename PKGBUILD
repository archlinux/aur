# Maintainer: Ludovico de Nittis <aasonykk+aur at google mail dot com>

pkgname=babel-glade
pkgver=0.6.0
pkgrel=1
pkgdesc="Babel Glade XML files translatable strings extractor."
arch=('any')
url="https://github.com/gnome-keysign/babel-glade"
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-babel')
_commit=40b88d7701ead154f0effd7621202891335d71b3  # version 0.6.0
source=("git+https://github.com/gnome-keysign/babel-glade.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd $pkgname
    python setup.py build
}

package() {
    cd $pkgname
    python setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
