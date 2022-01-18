# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain
pkgver=0.4.7
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('7515c0429590a858e6a2b3157f27d8e6a80e18014e384fb4896f5f3824a40ea1')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
