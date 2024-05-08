# Maintainer: Eklairs <eklairs@proton.me>

pkgname=tlock
pkgver=1.0.0
pkgrel=1
pkgdesc="Two-Factor Authentication Tokens Manager in Terminal"
url="https://github.com/eklairs/tlock"
arch=("x86_64")
license=("MIT")
tarball=tlock-v$pkgver-linux-amd64.tar.gz
source=(
    "$tarball::$url/releases/download/v$pkgver/$tarball"
    "$url/raw/v$pkgver/LICENSE"
)
sha256sums=(
    "020759557a874aec996ddd6d052a414276e6a5158575a604b5436c0999335876"
    "cafb11f4cc6891f8107d98938be22dc809a1af951235504207e01028954bb52b"
)

package() {
    install -Dm0755 tlock "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
