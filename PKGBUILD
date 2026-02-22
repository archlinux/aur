# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>

pkgname=sleep-until
pkgver=2.0.1
pkgrel=1
pkgdesc='Sleep until a specified time'
arch=('i686' 'x86_64')
url='https://codeberg.org/maandree/sleep-until'
license=('custom:ISC')
depends=('linux>=2.6.25' 'glibc>=2.8')
makedepends=('glibc>=2.8' 'gcc' 'sed' 'auto-auto-complete')
source=($pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz)
sha256sums=(bc5195c7a295c7ea44117a6e46da508301d75fed66b6d3e3823bc83321896cf9)

build() {
    cd "$srcdir/sleep-until"
    make
}

package() {
    cd "$srcdir/sleep-until"
    make install DESTDIR="$pkgdir"
}
