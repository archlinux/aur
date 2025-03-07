# Maintainer: mia <mia@mia.jetzt>

pkgname='swc-js-bin'
pkgver='1.11.8'
pkgrel='1'
pkgdesc='Super-fast TypeScript / JavaScript compiler written in Rust'
arch=('x86_64')
url='https://swc.rs'
license=('Apache-2.0')
provides=('swc-js')
source=("swc-$pkgver::https://github.com/swc-project/swc/releases/download/v$pkgver/swc-linux-x64-gnu")
sha256sums=('2c2f8cde579ce95739810b759523a6a984d9d088e7b83d707ea3cb1c468ad682')

package() {
  install -Dm 755 "$srcdir/swc-$pkgver" "$pkgdir/usr/bin/swc"
}
