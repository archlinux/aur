# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=sleep-until
pkgver=2
pkgrel=1
pkgdesc='Sleep until a specified time'
arch=('i686' 'x86_64')
url='https://codeberg.org/maandree/sleep-until'
license=('custom:ISC')
depends=('linux>=2.6.25' 'glibc>=2.8')
makedepends=('glibc>=2.8' 'gcc' 'sed' 'auto-auto-complete')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(c3a7d9983bd4968ad28f4c3604fa90603cc5409fda5946303a167a25c9b7d086)

build() {
    cd "$srcdir/sleep-until"
    make
}

package() {
    cd "$srcdir/sleep-until"
    make install DESTDIR="$pkgdir"
}
