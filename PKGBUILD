# Maintainer: Marco Scarpetta <marcoscarpetta02@gmail.com>
pkgname=scopa
pkgver=1.0.0
pkgrel=1
pkgdesc='The italian card game Scopa'
arch=('i686' 'x86_64')
url='http://scopa.nongnu.org'
license=('GPL3')
depends=('qt5-webengine')
source=("http://download.savannah.gnu.org/releases/scopa/$pkgname-$pkgver.tar.gz")
md5sums=('ba7876404e099654fc45cbf7dfe8c275')

build() {
    cd $pkgname-$pkgver
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
}
