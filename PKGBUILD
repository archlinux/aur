# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain
pkgver=0.5.0
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('32bbeb9753a06510078c7bf6c03bc512d1d1cd7bf522bd5c46a31c9500e01bcd')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
