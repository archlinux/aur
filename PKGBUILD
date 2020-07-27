# cstatus

# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=cstatus
pkgver=0.0.2
pkgrel=2
pkgdesc='Minimal statusbar for dwm written in c99.'
arch=('x86_64')
url='https://github.com/andreafeletto/cstatus'
license=('MIT')
provides=('cstatus')
conflicts=('cstatus-git')
source=("https://github.com/andreafeletto/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('64164653920d1da355ae17b53ebdd591514a56430ef19aaa79a79460225f1152')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" PREFIX=/usr install
}
