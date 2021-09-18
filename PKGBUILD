# Maintainer: Henry Nelson <hcnelson99@gmail.com>
pkgname=zig-static
pkgver=0.8.1
pkgrel=1
epoch=
pkgdesc="robust, optimal, and clear programming language"
arch=('x86_64')
url="https://ziglang.org/"
license=('MIT')
depends=()
makedepends=()
provides=('zig')
conflicts=('zig')
source=("https://ziglang.org/download/$pkgver/zig-linux-x86_64-$pkgver.tar.xz")
md5sums=('b74c2451c7786248a6e2ba657150efb7')

package() {
    cd "$srcdir/zig-linux-x86_64-$pkgver"
    install -D zig "$pkgdir/usr/bin/zig"
    install -D LICENSE "$pkgdir/usr/share/licenses/zig/LICENSE"
    cp -r lib "$pkgdir/usr"
    install -d "$pkgdir/usr/share/doc"
    cp -r doc "$pkgdir/usr/share/doc/zig"
}
