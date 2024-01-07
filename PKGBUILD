# Maintainer: Funami
pkgname=fend-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/printfn/fend"
license=('GPL3')
provides=('fend')
conflicts=('fend')
source=("https://github.com/printfn/fend/releases/download/v$pkgver/fend.1")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-armv7-gnueabihf.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('b2a23e220473a9151f76bf18dc27c94ccc09afe4b7eacb49848d0a181bfdee38')
sha256sums_x86_64=('a68f0324be2f21efa706c37a03d7fd017cfab5c33e74f7d0e117512cf7814f5f')
sha256sums_armv7h=('97230709e264ea783d60474902d6c2b3b79fe9a09abac58daa6522e3fab11187')
sha256sums_aarch64=('f9ee1db67c3ffa8f3d97eb2b681140efc512c61ec0e38f3c33534856474f5a04')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 fend.1 -t "$pkgdir/usr/share/man/man1"
}
