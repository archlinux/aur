# Maintainer: XIE Yuheng <xyheme@gmail.com>

pkgname=fasm-linux-git
pkgver=1.71.39
pkgrel=3
pkgdesc="fast assembler for x86 and x86-64 [github mirror of linux version]"
url="http://flatassembler.net/"
makedepends=('git')
license=('custom')
arch=('i686' 'x86_64')
source=('git+https://github.com/the-little-language-designer/fasm-linux.git')
provides=('fasm')
conflicts=('fasm')
md5sums=('SKIP')

build() {
  cd "$srcdir/fasm-linux"
  make
}

package() {
  cd "$srcdir/fasm-linux"
  make PREFIX="$pkgdir/usr" install
}
