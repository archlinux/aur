# Maintainer: Alexander Phinikarides <alexisph at gmail dot com>

_gitname="python-itunes"
pkgname=("python2-itunes-git")
pkgver="r50.4585f1c"
pkgrel="4"
pkgdesc="A simple python wrapper to access iTunes Store API."
arch=("any")
depends=("python2")
provides=("python2-itunes")
conflicts=("python2-itunes")
url="https://github.com/ocelma/${_gitname}"
license=("GPLv3")
makedepends=("python2-setuptools")
source=("git://github.com/ocelma/${_gitname}.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_gitname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_gitname}"
    python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1
}
