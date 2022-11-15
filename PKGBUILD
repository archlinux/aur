# Maintainer: Ayaka Mikazuki <ayaka@mail.shn.hk>

pkgname=grain-bin
pkgver=0.5.4
pkgrel=1
pkgdesc="A modern web staple. A new language that puts academic language features to work"
arch=('x86_64')
url="https://github.com/grain-lang/grain"
license=('LGPL3')
provides=('grain')
conflicts=('grain')
depends=('gcc-libs')
source=("grain::$url/releases/download/grain-v$pkgver/grain-linux-x64")
sha256sums=('15cb70278431fe714c112a7c8a754e6dbd452fb679813a792fbd9b4046ca1820')
options=(!strip)

package() {
  cd "$srcdir"
  install -Dm755 grain "$pkgdir/usr/bin/grain"
}
