# Maintainer: mia <mia@mia.jetzt>

pkgname='swc-js-bin'
pkgver='1.5.29'
pkgrel='2'
pkgdesc='Super-fast TypeScript / JavaScript compiler written in Rust'
arch=('x86_64')
url='https://swc.rs'
license=('Apache-2.0')
provides=('swc-js')
source=("https://github.com/swc-project/swc/releases/download/v$pkgver/swc-linux-x64-gnu")
sha256sums=('e120da4fa7a6be4d9c9e75a3b9d37822ff4880c5a48f2a88f9099ce527f56215')

package() {
  install -Dm 755 "$srcdir/swc-linux-x64-gnu" "$pkgdir/usr/bin/swc"
}
