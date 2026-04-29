# Maintainer: Kolja Wilcke <kolja.wilcke@proton.me>
pkgname=loriini-bin
_pkgname=loriini
pkgver=0.1.8
pkgrel=1
pkgdesc="A console color picker"
arch=('x86_64')
url="https://github.com/kolja/loriini"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug')
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/loriini-${CARCH}-unknown-linux-musl.tar.gz"
               "LICENSE-$pkgver.md::$url/raw/v$pkgver/LICENSE.md")
sha256sums_x86_64=('44e9b288b11f0414573d7957e89c1c5e6352c0a47a031040356c3c0225d9fcd2'
                   'SKIP')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
