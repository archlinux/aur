# Maintainer: wincak <wincak@seznam.cz>
pkgname=threshy-gui
pkgver=0.2
pkgrel=0
pkgdesc="Qt GUI for Threshy"
arch=('x86_64')
url="https://gitlab.com/wincak/threshy-gui"
license=('GPL')
depends=('threshy>=0.2' 'qt5-base>=5.9')
install=
source=("git+https://gitlab.com/wincak/threshy-gui.git#tag=v0.2")
md5sums=('SKIP')

prepare() {
    # TODO
    cd "$pkgname"
}

build() {
    cd "$pkgname"

    qmake PREFIX=/usr

    make
}

check() {
    # TODO
    cd "$pkgname"
    #make -k check
}

package() {
    cd "$pkgname"
    make INSTALL_ROOT="$pkgdir/" install
}
