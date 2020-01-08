# Author : Caroline Chao
# Maintainer: Esclapion <esclapion[at]gmail[dot]com>
 
pkgname=weather-app
pkgver=1.0
pkgrel=3
pkgdesc="QuickForecast : qt-labs/weather application"
arch=('i686' 'x86_64')
url="https://qt.gitorious.org/qt-labs/weather-app"
license=('BSD')
groups=()
depends=('qt5-base' 'qt5-quickcontrols')
makedepends=('qtchooser')
optdepends=()
provides=('weather-app')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://esclapion.free.fr/AUR/weather-app.tar.gz")
sha512sums=('82e189f02b95e67343de886a06619bd5ec5018414c0f791b23cd4c67ceca52d01e6eb9c635ed51590c8be8f64ce2601db0279de6039821702a4b2b1d4b7dc96a')

build() {
        cd "$srcdir/$pkgname"
        qmake
        make
}
 
package() {
        cd "$srcdir/$pkgname"
        mkdir -p $pkgdir/usr/bin/
        cp QuickForecast $pkgdir/usr/bin/
}
