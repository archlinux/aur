# Maintainer: Funami
pkgname=fend-bin
pkgver=1.0.3
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
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('9976b2d5c68966c9e5cec76ab25beb1a67eb271f8f58ef0534f441d6bd74470c')
sha256sums_x86_64=('6c1d920dd2a1bb14c874c013ef2bbf911a5d776e0ee606b417bb87d057c96ed6')
sha256sums_armv7h=('e3fce783e78ebbed525576d9e10b3c414a397e1f86f4397da3b9143443872ff6')
sha256sums_aarch64=('14722d833f4d0b524413cd8cee1f3615396552284f2118133931fab4bd23856d')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/fend/LICENSE"
}
