# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain
pkgver=0.4.6
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('95255041bb056bc5992fe9301844c6c2ff83d6b7085bc81b247ad464e8c53a14')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
