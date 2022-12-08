# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('e26af1d73377c6237d3ad291a807f37bfa59aa2448a96fe4d9ff820dadc00c99')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
