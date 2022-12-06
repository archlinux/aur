# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain-bin
pkgver=0.5.6
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('3c62ff6042e1754962e079086c979bebec7cf5857815967c59a7dda4e72226b2')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
