# Maintainer: Nakidai <plaza521 at inbox dot ru>
pkgname=nomi-bin
pkgdesc="Minecraft launcher powered by Rust"
url="https://github.com/Umatriz/nomi"
license=("GPL-3.0-or-later")

provides=("nomi")
conflicts=("nomi")

pkgver=0.2.3
pkgrel=1

arch=("x86_64")
depends=("glibc" "gcc-libs" "bzip2")

source=(
    "$pkgname-$pkgver::https://github.com/Umatriz/nomi/releases/download/$pkgver/client-x86_64-unknown-linux-gnu"
)
sha256sums=('226ff653b17cb5a20306f8c520122797ddbc364d234c7c3f0c6fb6b5380fa681')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nomi"
}
