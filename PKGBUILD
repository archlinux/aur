
# Maintainer: mia <mia@mia.jetzt>

pkgname='swc-js-bin'
pkgver='1.11.24'
pkgrel='1'
pkgdesc='Super-fast TypeScript / JavaScript compiler written in Rust'
arch=('x86_64')
url='https://swc.rs'
license=('Apache-2.0')
provides=('swc-js')
source=("swc-$pkgver::https://github.com/swc-project/swc/releases/download/v$pkgver/swc-linux-x64-gnu")
sha256sums=('78a580a5d7aa4a6ba0e3d0de3ebb5519c4aef5d8ee56a8b1729844e640301be3')

package() {
  install -Dm 755 "$srcdir/swc-$pkgver" "$pkgdir/usr/bin/swc"
}
