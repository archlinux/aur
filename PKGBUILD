# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasm3-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="The fastest WebAssembly interpreter and the most universal runtime"
arch=('x86_64')
url="https://github.com/wasm3/wasm3"
license=('MIT')
provides=("wasm3=$pkgver")
conflicts=('wasm3')
source=("https://raw.githubusercontent.com/wasm3/wasm3/main/LICENSE")
source_x86_64=("$pkgname-$CARCH-$pkgver::https://github.com/wasm3/wasm3/releases/download/v$pkgver/wasm3-linux-x64.elf")
sha256sums=('SKIP')
sha256sums_x86_64=('05bf303d35feb05e6c5885a31f607ff20daca391d0dd5fa342cc29fbbf8c93d2')


package() {
  install -Dm755 "$srcdir/$pkgname-$CARCH-$pkgver" "$pkgdir/usr/bin/wasm3"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/wasm3"
}
