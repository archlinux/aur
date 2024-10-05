# Maintainer: Funami
pkgname=fend-bin
pkgver=1.5.3
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
            '3f14b3f69ce9c2720070d6548976eeff60f965ab4ffc9a7109982e179a1be85e')
sha256sums_x86_64=('a1ff2e6eba3e9b9a338b3e2ed39f2afd091313f295ca4d54f4db6eea07bd871b')
sha256sums_armv7h=('9722891ffa7e129cb90086f93f61fd5f791a4cdb752bd174e1c930fd2e54d2b9')
sha256sums_aarch64=('6e24fcbf643d3ae382b65de435b913c4199d12244af998445a4b3aa580421488')

package() {
  install -Dm755 fend -t "$pkgdir/usr/bin"
  install -Dm644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/licenses/fend/LICENSE"
  install -Dm644 "$pkgname-$pkgver-fend.1" "$pkgdir/usr/share/man/man1/fend.1"
}
