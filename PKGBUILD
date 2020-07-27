# Maintainer: Ludovico de Nittis <aasonykk+aur at google mail dot com>

pkgname=python-babel-glade
_pkgname=babel-glade
pkgver=0.7.0
pkgrel=1
pkgdesc="Python library for Babel Glade XML files translatable strings extractor."
arch=('any')
url="https://github.com/gnome-keysign/babel-glade"
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-babel')
_commit=c7651600ce95be1b8183a8eb889a35293b577ba3  # version 0.7.0
source=("git+https://github.com/gnome-keysign/babel-glade.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
