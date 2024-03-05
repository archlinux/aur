# Maintainer: Funami
pkgname=fend-bin
pkgver=1.4.4
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
sha256sums=('a4003da96c3699d5d67eb694bc6dbe85082930fa1e401be49d11fea4f93b1ed4')
sha256sums_x86_64=('1dda879919001b81a06d40b53046e759888eb25cb1d23dc61083e0a41be18e0e')
sha256sums_armv7h=('617ef87d7ffcacef7145b7e02292753a7fac2e389a2a408e5b13f0a46a040057')
sha256sums_aarch64=('e8c86ca108bf3b396dedd20fc1b70bddea68a8abfbf7103c93aac82a1e2c42c4')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
