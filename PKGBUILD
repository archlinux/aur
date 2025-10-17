# Maintainer: Fuad Daoud <aur@fuad-daoud.com>

pkgname=pkgmate-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="TUI for application to manage your dependencies"
arch=('x86_64')
url="https://github.com/fuad-daoud/pkgmate"
license=('MIT')
provides=()
conflicts=()
source_x86_64=("$pkgname-$pkgver-x86_64::$url/releases/download/$pkgver/pkgmate-linux-amd64")
sha256sums_x86_64=('SKIP')

package() {
    if [ "$CARCH" = "x86_64" ]; then
        install -Dm755 "$srcdir/$pkgname-$pkgver-x86_64" "$pkgdir/usr/bin/pkgmate"
    fi
}
