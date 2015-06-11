# Maintainer: Mathieu OTHACEHE <m.othacehe@gmail.com>

pkgname=eventstat
pkgver=0.01.33
pkgrel=1
pkgdesc="Simple monitoring of system events"
url="http://kernel.ubuntu.com/~cking/eventstat/"
arch=('any')
license=('GPL')
source=("http://kernel.ubuntu.com/~cking/tarballs/eventstat/$pkgname-$pkgver.tar.gz")
md5sums=('c825229426ff4192b370fcbb81474f38')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
