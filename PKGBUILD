# Maintainer: demian <mikar ατ gmx δοτ de>
pkgname=demibot
pkgver=0.3
pkgrel=2
pkgdesc="A modular IRC bot"
arch=("any")
url="https://github.com/mikar/${pkgname}"
license=("MIT")
depends=("twisted" "python2-docopt" "python2-setuptools")
optdepends=("python2-requests" "python2-beautifulsoup4" "python2-dateutil")
install=${pkgname}.install

source=("https://github.com/mikar/${pkgname}/archive/master.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir"/${pkgname}-master

    python2 setup.py install --root="${pkgdir}"
}
