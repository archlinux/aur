# Maintainer: yaroslav <proninyaroslav@mail.ru>

pkgname=onioncircuits
pkgver=0.3
pkgrel=1
pkgdesc="GTK application to display Tor circuits and streams"
arch=('i686' 'x86_64')
url="https://git-tails.immerda.ch/onioncircuits"
license=('GPL3')
depends=('python>=3.4.2' 'python-gobject>=3.14.0' 'stem>=1.2.2' 'gobject-introspection' 'python-distutils-extra')
makedepends=('git')
source=("${pkgname}::git://git.tails.boum.org/onioncircuits")
sha256sums=('SKIP')

build() {
    cd ${pkgname}

    ./setup.py build
}
package() {
    cd ${pkgname}

    ./setup.py install --root="${pkgdir}/"
}
