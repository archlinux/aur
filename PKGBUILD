# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain
pkgver=0.5.1
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('5364de1dc0f01acf4c2c29c62a48bc33b9502284d1d8a3e23751228d963f4038')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
