# Maintainer: mia <mia@mia.jetzt>

pkgname='swc-js-bin'
pkgver='1.10.15'
pkgrel='2'
pkgdesc='Super-fast TypeScript / JavaScript compiler written in Rust'
arch=('x86_64')
url='https://swc.rs'
license=('Apache-2.0')
provides=('swc-js')
source=("swc-$pkgver::https://github.com/swc-project/swc/releases/download/v$pkgver/swc-linux-x64-gnu")
sha256sums=('8681231a21938c49adc015529199d5296b0d9914bbc11e5d684ec9c09faba2c2')

package() {
  install -Dm 755 "$srcdir/swc-$pkgver" "$pkgdir/usr/bin/swc"
}
