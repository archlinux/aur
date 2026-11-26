# Maintainer: pusi77 <pusineriandrea+gmail+com>

pkgname=ciphey-bin
pkgver=0.12.1
pkgrel=1
pkgdesc="Automatically decrypt encryptions without knowing the key or cipher, decode encodings, and crack hashes (prebuilt binary)"
arch=('x86_64')
url="https://github.com/bee-san/Ciphey"
license=('MIT')
depends=('glibc' 'libgcc' 'openssl-3')
provides=('ciphey')
conflicts=('ciphey')
options=('!debug')
source=("LICENSE-$pkgver::https://raw.githubusercontent.com/bee-san/Ciphey/v$pkgver/LICENSE")
source_x86_64=("ciphey-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/ciphey-linux-x86_64.tar.gz")
sha256sums=('3449bc6bc62a1648dbb60f73b18a879d07ecc2d5d7b6097ebcf9156ed32c3c00')
sha256sums_x86_64=('1ccc9766224c63c5703414bea2a60adb80ec9730d5afa2b1ecba81101d4c5659')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" ciphey
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
