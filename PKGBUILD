# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=b3sum-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="BLAKE3 hash function CLI utility, written in Rust"
arch=('x86_64')
url="https://github.com/BLAKE3-team/BLAKE3"
license=('custom:CC1')
provides=('b3sum')
conflicts=('b3sum')
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/b3sum_linux_x64_bin")
sha256sums=('891f301fdbe79543b9367593c8afaa3f6d0e4d38ae9f91535f7617a97c21e18e')
noextract=("$pkgname-$pkgver")

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/b3sum"
}
