# Maintainer: Funami
pkgname=fend-bin
pkgver=1.5.5
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
            '65be3b5b9c49fd13bab854eb1ffa9e14ae533d2623bcccedba48e935ecbe0584')
sha256sums_x86_64=('5d2130c25c146ea748370aad783dcb8f52ec2ef560d87bf11d863b8bcd106af6')
sha256sums_armv7h=('b2a2ab1da17589675db7720febfbd54228bfcd53b042a58804e839aec49d15e9')
sha256sums_aarch64=('9229afd273c878f18cbdd3b4548fd1fc5d5f3ff2611df3061382a205aa11231b')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
