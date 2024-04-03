# Maintainer: Sterophonick
pkgname=unkrawerter-gba
_pkgname='unkrawerter-gba'
pkgver=4.0.999e310
pkgrel=1
pkgdesc='A tool to rip music from Gameboy Advance games that use the Krawall sound engine.'
url='https://github.com/MCJack123/UnkrawerterGBA'
arch=(x86_64 i686 aarch64)
makedepends=(base-devel)
source=(git+https://github.com/MCJack123/UnkrawerterGBA)
md5sums=('SKIP')
license=('None')

package() {
  mkdir -p $pkgdir/usr/bin
  g++ -std=c++11 -o $pkgdir/usr/bin/UnkrawerterGBA $srcdir/UnkrawerterGBA/unkrawerter.cpp
}
