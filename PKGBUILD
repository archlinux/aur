# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=pwrnotify
pkgver=0.2.1
pkgrel=1
pkgdesc="Simple battery status notifier"
arch=(any)
url='http://ikn.org.uk/pwrnotify'
license=(GPL3)
depends=(libnotify)
source=(http://ikn.org.uk/files/desktop/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('389594df6764e3110b86db04dbb91a1c')

build () {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix="/usr" install
}
