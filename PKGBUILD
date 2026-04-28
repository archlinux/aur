# Maintainer: Kolja Wilcke <kolja.wilcke@proton.me>
pkgname=loriini-bin
_pkgname=loriini
pkgver=0.1.7
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
sha256sums_x86_64=('3e4261aa2fba161a53a74774e0d0a5521722e0759da55b18fdfa23ba09348cd0'
                   'SKIP')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE-$pkgver.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
