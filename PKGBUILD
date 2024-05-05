# Maintainer: Funami
pkgname=fend-bin
pkgver=1.4.8
pkgrel=1
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/printfn/fend"
license=('MIT')
provides=('fend')
conflicts=('fend')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/printfn/fend/v$pkgver/LICENSE.md"
        "$pkgname-$pkgver-fend.1::https://github.com/printfn/fend/releases/download/v$pkgver/fend.1")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x64.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-armv7-gnueabihf.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('1992e36d631c5f8df9716fb1b736b3b138157ff98c87baa9889be7593841a1df'
            'c0c8f8d188b5baa6c355edb81b57e48f4bff16be47edbbba9287dfb5f45222d7')
sha256sums_x86_64=('7eab278e9ec128fd24163b691f61f347ae4395b90310898256acb89c5cc6307d')
sha256sums_armv7h=('db84f8365ead19c6e3414c68556adc42a96573116cb01c7fdf2278fafce2ad53')
sha256sums_aarch64=('395f5c43eafacd4621d43c83d892ac575a213855b2947f5b009567b09926e838')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
