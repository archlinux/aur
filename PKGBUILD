# Maintainer: Funami
pkgname=fend-bin
pkgver=1.4.5
pkgrel=1
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/printfn/fend"
license=('GPL3')
provides=('fend')
conflicts=('fend')
source=("$pkgname-$pkgver-fend.1::https://github.com/printfn/fend/releases/download/v$pkgver/fend.1")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-armv7-gnueabihf.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('0161a89e36e93b558e253bfb9daef2ebf85c82ed7f992b72963edbf63350e9be')
sha256sums_x86_64=('41fb85acadd9a96cf038e34c62a21e62f856161a4b968a9035995ecb9f002384')
sha256sums_armv7h=('dcf1416d7a0502d72625d74b0ffc7090b9bbd6580765c315a5459bfd89823061')
sha256sums_aarch64=('2af6fdd276824c3ff04334e2856dbfce55ac93a2fb80e62b698ba85cec8875eb')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
