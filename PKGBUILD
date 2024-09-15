# Maintainer: Funami
pkgname=fend-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Arbitrary-precision unit-aware calculator"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/printfn/fend"
license=('MIT')
provides=('fend')
conflicts=('fend')
source=("$pkgname-$pkgver-LICENSE::https://raw.githubusercontent.com/printfn/fend/v$pkgver/LICENSE.md"
        "$pkgname-$pkgver-fend.1::https://github.com/printfn/fend/releases/download/v$pkgver/fend.1")
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-x86_64-gnu.zip")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-armv7-gnueabihf.zip")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::https://github.com/printfn/fend/releases/download/v$pkgver/fend-$pkgver-linux-aarch64-gnu.zip")
sha256sums=('1992e36d631c5f8df9716fb1b736b3b138157ff98c87baa9889be7593841a1df'
            '58fdfd691c68a5f9b5edb791712da13da4a5f9f0d397cda94423b0bbf45a25eb')
sha256sums_x86_64=('8d8d304938d500debd0df3486f00e55afe7311872a0ce61472b07dc8f721260a')
sha256sums_armv7h=('daf89b3bbd0a58d3316ac6a96a2c0f5597785fab4c48d59a318eda600d416a22')
sha256sums_aarch64=('77eb6e0ceed9e6314c9eae028984d45e0801e7a193dd920c2f143decedb24cbd')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
