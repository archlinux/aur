# Maintainer: Funami
pkgname=fend-bin
pkgver=0.1.29
pkgrel=1
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/printfn/fend"
license=('MIT')
provides=('fend')
conflicts=('fend')
source=("https://raw.githubusercontent.com/printfn/fend/v$pkgver/LICENSE.md")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-armv7-gnueabihf.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64.zip")
sha256sums=('9976b2d5c68966c9e5cec76ab25beb1a67eb271f8f58ef0534f441d6bd74470c')
sha256sums_x86_64=('99ec104b2f281596f3189f70a2f96250b526452c0ea45588515e36eefb3107f8')
sha256sums_armv7h=('be7c63b02f4f9f9a6d748f770b0e69465d21e0a504ed75479c40163870153e15')
sha256sums_aarch64=('899c9ecc10cc4eb64dcaec11bfaa21bf600a8e7ed97cb8afa27930f2ee7346d7')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
}
