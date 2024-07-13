# Maintainer: Nakidai <plaza521 at inbox dot ru>
pkgname=nomi-bin
pkgdesc="Minecraft launcher powered by Rust"
url="https://github.com/Umatriz/nomi"
license=("GPL-3.0-or-later")

provides=("nomi")
conflicts=("nomi")

pkgver=0.2.2
pkgrel=1

arch=("x86_64")
depends=("glibc" "gcc-libs" "bzip2")

source=(
    "$pkgname-$pkgver::https://github.com/Umatriz/nomi/releases/download/$pkgver/client-x86_64-unknown-linux-gnu"
)
sha256sums=('bbb06c3656485ed48dbd324d61e990a95726da0600fe6be0a66dccb70d226ca5')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nomi"
}
