# Maintainer: Olivia <olmay@tuta.io>
pkgname=livsdiary
pkgver=1.1.0
pkgrel=2
pkgdesc="A simple, free and open source command-line diary"
arch=('x86_64')
url="https://github.com/olivia-livs/livsdiary"
license=('GPL3')
source=("https://github.com/olivia-livs/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('971662f9d75f2a22419d6669af1845f01e0ffe276ae6ca4f138cbd44ee52782e')

build() {
        cd "$pkgname-$pkgver"
        #./configure --prefix=/usr
        make
}

package() {
        cd "$pkgname-$pkgver"
        install -D livsdiary "${pkgdir}/usr/bin/livsdiary"
}
