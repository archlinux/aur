# Maintainer: mia <mia@mia.jetzt>

pkgname='swc-js-bin'
pkgver='1.10.4'
pkgrel='2'
pkgdesc='Super-fast TypeScript / JavaScript compiler written in Rust'
arch=('x86_64')
url='https://swc.rs'
license=('Apache-2.0')
provides=('swc-js')
source=("https://github.com/swc-project/swc/releases/download/v$pkgver/swc-linux-x64-gnu")
sha256sums=('3af249c6f94ea389b878091285e75649defa743ab462bb74fb9991af8a998088')

package() {
  install -Dm 755 "$srcdir/swc-linux-x64-gnu" "$pkgdir/usr/bin/swc"
}
