# Maintainer: Andrew Lee <alee14498 at protonmail dot com>
pkgname=aleeplayer
pkgver=1.0.0
pkgrel=0
pkgdesc="An audio player written in Qt"
arch=("x86_64")
url="https://github.com/aleeproductions/AleePlayer"
license=('GPL3')
depends=('libmusicbrainz5' 'xdg-utils' 'qt5-base' 'taglib' 'qt5-svg')
makedepends=('git' 'qt5-tools')
source=("$pkgname-$pkgver"::"https://github.com/aleeproductions/AleePlayer/archive/master.tar.gz")
sha256sums=('SKIP')

build() {
    cd "AleePlayer-master"
    qmake
    make
}

package() {
    cd "AleePlayer-master"
    make install INSTALL_ROOT=$pkgdir
}
