# Maintainer: j8takagi <j8takagi@nifty.com>
pkgname=yacasl2
PKGname=YACASL2
pkgver=0.5p35
_pkgver=${pkgver/p/p}

pkgrel=1
pkgdesc="CASL2/COMET2 simulator for Japanese Information Technology examination"
arch=('x86_64')
url="https://github.com/j8takagi/yacasl2"
license=('GPL')
depends=()
makedepends=('texinfo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
    cd "$PKGname-$pkgver"
    make
}

package() {
    cd "$PKGname-$pkgver"
    make prefix="$pkgdir/usr" bindir="$pkgdir/usr/bin" install
}
