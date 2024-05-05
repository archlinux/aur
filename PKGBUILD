# Maintainer: Eklairs <eklairs@proton.me>

pkgname=tlock
pkgver=1.0.0
pkgrel=1
pkgdesc="Two-Factor Authentication Tokens Manager in Terminal"
url="https://github.com/eklairs/tlock"
arch=("x86_64")
license=("MIT")
_binary=tlock-v$pkgver-linux-release
source=(
    "$_binary::$url/releases/download/v$pkgver/$_binary"
    "$url/raw/v$pkgver/LICENSE"
)
sha256sums=("SKIP" "SKIP")

package() {
    install -Dm0755 "$_binary" "$pkgdir/usr/bin/$pkgname"
    install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
