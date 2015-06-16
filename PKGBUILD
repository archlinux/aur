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
md5sums=('1ea9c9717ae82571c3b0e51a2817eb98')
 
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
