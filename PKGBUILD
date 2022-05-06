# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=wasm3-bin
pkgver=0.5.0
pkgrel=2
pkgdesc="The fastest WebAssembly interpreter and the most universal runtime"
arch=('x86_64')
url="https://github.com/wasm3/wasm3"
license=('MIT')
provides=("wasm3=$pkgver")
conflicts=('wasm3')
source=("https://raw.githubusercontent.com/wasm3/wasm3/main/LICENSE")
source_x86_64=("wasm3::https://github.com/wasm3/wasm3/releases/download/v$pkgver/wasm3-linux-x64.elf")
sha256sums=('SKIP')
sha256sums_x86_64=('905292b6700413dd7f2293e0f44dbc853a743ef2d0a6d0043490acf34526e4de')


package() {
  install -Dm755 "$srcdir/wasm3" -t "$pkgdir/usr/bin"
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/wasm3"
}
