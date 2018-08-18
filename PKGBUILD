# Maintainer: Luclu7 <luclu7@luclu7.fr>

pkgname=eventstat-updated
pkgbase=eventstat-updated
pkgver=0.04.04
pkgrel=1
pkgdesc="Simple monitoring of system events"
url="http://kernel.ubuntu.com/~cking/eventstat/"
arch=('any')
license=('GPL')
source=("http://kernel.ubuntu.com/~cking/tarballs/eventstat/$pkgname-$pkgver.tar.gz")
md5sums=('9934c3d8810ef5b0d0346907f4f25e09')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
