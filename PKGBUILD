# Maintainer: Nakidai <plaza521 at inbox dot ru>
pkgname=nomi-bin
pkgdesc="Minecraft launcher powered by Rust"
url="https://github.com/Umatriz/nomi"
license=("GPL-3.0-or-later")

provides=("nomi")
conflicts=("nomi")

pkgver=0.2.4
pkgrel=1

arch=("x86_64")
depends=("glibc" "gcc-libs" "bzip2" "openssl")

source=(
    "$pkgname-$pkgver::https://github.com/Umatriz/nomi/releases/download/$pkgver/client-$CARCH-unknown-linux-gnu"
)
sha256sums=('782aed7ff91916855b7240c54a7f2fa4ec2c03b9ae98b2eaf849edf16a4089ca')

package() {
    install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/nomi"
}
