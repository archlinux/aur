pkgname=deepin-qt-dbus-factory
pkgver=1.0.0
pkgrel=1
pkgdesc="Deepin framework DBus tools and file"
makedepends=('gcc')
arch=('x86_64' 'i686')
makedepends=('git' 'qt5-tools')
groups=('deepin')
source=("git+https://cr.deepin.io/dde/dde-qt-dbus-factory")
url="http://cr.deepin.io/"
license=("GPLV3")
sha256sums=('SKIP')

build() {
    cd dde-qt-dbus-factory
    qmake-qt5 PREFIX=/usr
    make
}

package() {
    cd dde-qt-dbus-factory
    make INSTALL_ROOT="$pkgdir" install
}

