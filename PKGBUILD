# Maintainer: mia <mia@mia.jetzt>

pkgname='swc-js-bin'
pkgver='1.10.1'
pkgrel='1'
pkgdesc='Super-fast TypeScript / JavaScript compiler written in Rust'
arch=('x86_64')
url='https://swc.rs'
license=('Apache-2.0')
provides=('swc-js')
source=("https://github.com/swc-project/swc/releases/download/v$pkgver/swc-linux-x64-gnu")
sha256sums=('05fcfd9f3ebd2a15bcf7b024c122f762841bd72cce38543ae5cc4d1578813642')

package() {
  install -Dm 755 "$srcdir/swc-linux-x64-gnu" "$pkgdir/usr/bin/swc"
}
