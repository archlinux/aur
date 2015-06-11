# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=demimove
pkgver=0.1
pkgrel=1
pkgdesc="A file browser for mass renaming."
arch=("any")
url="https://github.com/mikar/${pkgname}"
license=("MIT")
depends=("python2-pyqt4" "python2-docopt" "python2-setuptools")

source=("https://github.com/mikar/${pkgname}/archive/master.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"/${pkgname}-master

    python2 setup.py install --root="${pkgdir}"
}
