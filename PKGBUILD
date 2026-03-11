# Maintainer: wiatrak <wiatrak1122@proton.me>
pkgname=netburst
pkgver=1.0.0
pkgrel=1
pkgdesc="Program for sending internet packets, mainly designed for penetration testing"
arch=('x86_64')
url="https://github.com/zegar014/netburst"
license=('MIT')
depends=()
source=("netburst")
sha256sums=('70a8e83ee5b1805245de66ec844c46aff00606dbfcbe5664703cef59d2bc61ff')

package() {
    install -Dm755 "$srcdir/netburst" "$pkgdir/usr/bin/netburst"
}
