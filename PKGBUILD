# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=pwrnotify
pkgver=0.2.2
pkgrel=1
pkgdesc="Simple battery status notifier"
arch=(any)
url='http://ikn.org.uk/pwrnotify'
license=(GPL3)
depends=(libnotify)
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('03a2ce5fd11d8c8fcfcf225850d05f09')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix="/usr" install
}
