# Maintainer: Sergey A. <murlakatamenka@disroot.org>

pkgname=b3sum-bin
pkgver=0.3.8
pkgrel=1
pkgdesc="BLAKE3 hash function CLI utility, written in Rust"
arch=('x86_64')
url="https://github.com/BLAKE3-team/BLAKE3"
license=('custom:CC1')
provides=('b3sum')
conflicts=('b3sum')
source=("$pkgname-$pkgver::$url/releases/download/$pkgver/b3sum_linux_x64_bin")
sha256sums=('72195bf9011c6192720c578845c4ab6565123ac43608101ab6e4ed409e93d973')
noextract=("$pkgname-$pkgver")

package() {
    install -Dm 755 "$pkgname-$pkgver" "$pkgdir/usr/bin/b3sum"
}
