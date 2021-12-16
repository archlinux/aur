# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain
pkgver=0.4.5
pkgrel=3
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('3c536aa1351d21511b4ee6800e66332d5db2215c389adff8190d905c707f20b7')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
