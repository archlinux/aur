# Maintainer: Marco Scarpetta <marcoscarpetta02 at gmail dot com>
pkgname=scopa
pkgver=1.1.0a1
pkgrel=1
pkgdesc='The italian card game Scopa'
arch=('i686' 'x86_64')
url='http://scopa.nongnu.org'
license=('GPL3')
depends=('qt5-webengine')
source=("http://git.savannah.gnu.org/cgit/scopa.git/snapshot/$pkgname-1.1.0-alpha1.tar.gz")
md5sums=('712ca6a2e2ec9effa4f9fbdf822b9437')

build() {
    cd $pkgname-1.1.0-alpha1
    make
}

package() {
    cd $pkgname-1.1.0-alpha1
    make DESTDIR="$pkgdir/" install
}
