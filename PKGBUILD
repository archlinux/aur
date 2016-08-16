# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>
pkgname=scopa
pkgver=1.0.0b1
pkgrel=2
pkgdesc='The italian card game Scopa'
arch=('i686' 'x86_64')
url='http://www.nongnu.org/scopa/'
license=('GPL3')
depends=('qt5-webengine')
source=("http://download.savannah.gnu.org/releases/scopa/$pkgname-$pkgver.tar.gz")
md5sums=('0a473ecbe287d4f78551c9cdce897fab')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}
