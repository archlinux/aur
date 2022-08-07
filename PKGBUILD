# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain-bin
pkgver=0.5.3
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('ed00ef978cf881b653eb2b3d4259f4e25833cc8faa1862f72ec13c0fe9c9c690')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
