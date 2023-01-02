# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain-bin
pkgver=0.5.11
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('a8807cb4a7e6c7c79d05c8a9a32aec0e9aa660e7fedfc560b75457ff4afa7a8d')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
