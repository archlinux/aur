# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasm3-bin
pkgver=0.9.0
pkgrel=2
pkgdesc="The fastest WebAssembly interpreter and the most universal runtime"
arch=('x86_64')
url="https://github.com/wasm3/wasm3"
license=('MIT')
provides=("wasm3=$pkgver")
conflicts=('wasm3')
source=("https://raw.githubusercontent.com/wasm3/wasm3/main/LICENSE")
source_x86_64=("$pkgname-$CARCH-$pkgver::https://github.com/wasm3/wasm3/releases/download/v$pkgver/wasm3-linux-x64.elf")
sha256sums=('SKIP')
sha256sums_x86_64=('2aa7d4e6dfb0e0dc1880f3f470e7dd36476668ff8776b3e7f376c7367452a406')


package() {
  install -Dm755 "$srcdir/$pkgname-$CARCH-$pkgver" -t "$pkgdir/usr/bin/wasm3"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/wasm3"
}
